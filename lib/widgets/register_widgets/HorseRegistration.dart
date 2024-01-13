import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

class HorseRegistration {
  String imagePath;
  List<int> selectedStats;
  String horseName;

  HorseRegistration({
    required this.imagePath,
    required this.selectedStats,
    required this.horseName,
  });

  Map<String, dynamic> toMap() {
    return {
      'imagePath': imagePath,
      'selectedStats': selectedStats,
      'horseName': horseName,
    };
  }

  factory HorseRegistration.fromMap(Map<String, dynamic> map) {
    return HorseRegistration(
      imagePath: map['imagePath'],
      selectedStats: List<int>.from(map['selectedStats']),
      horseName: map['horseName'],
    );
  }

  static Future<List<HorseRegistration>> loadFromJson() async {
    try {
      final file = File('data/horse_registration.json');
      final jsonString = await file.readAsString();

      final List<dynamic> jsonList = jsonDecode(jsonString);

      return jsonList.map((json) => HorseRegistration.fromMap(json)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> addToJson() async {
    final existingData = await loadFromJson();
    existingData.add(this);

    final jsonData = existingData.map((horse) => horse.toMap()).toList();
    final jsonString = jsonEncode(jsonData);

    final file = File('data/horse_registration.json');
    await file.writeAsString(jsonString);
  }
}

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _RegistrationScreenContent();
  }
}

class _RegistrationScreenContent extends StatefulWidget {
  const _RegistrationScreenContent({Key? key}) : super(key: key);

  @override
  __RegistrationScreenContentState createState() =>
      __RegistrationScreenContentState();
}

class __RegistrationScreenContentState
    extends State<_RegistrationScreenContent> {
  List<int> selectedStats = List.generate(4, (index) => -1);
  String horseName = '';
  String imageData = ''; // Esta variable debería obtenerse de la selección de la imagen.

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // ... (resto del código del app bar)
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(17),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ... (resto del código del widget)
              ElevatedButton(
                onPressed: () async {
                  final horseRegistration = HorseRegistration(
                    imagePath: imageData,
                    selectedStats: selectedStats,
                    horseName: horseName,
                  );

                  await horseRegistration.addToJson();
                },
                style: ElevatedButton.styleFrom(
                  // ... (resto del estilo del botón)
                ),
                child: const Text(
                  'REGISTER',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: RegistrationScreen(),
  ));
}