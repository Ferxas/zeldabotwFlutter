import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:jma_app_project/screens/registration_screen.dart';
import 'package:jma_app_project/widgets/compendium_widgets/show_element_list.dart';
import 'package:jma_app_project/widgets/general_widgets/home_button.dart';
import 'package:jma_app_project/widgets/general_widgets/important_tittle.dart';

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
  Uint8List? imageData;
  String jsonFilePath = "path_to_your_file.json";

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      Uint8List bytes = result.files.first.bytes!;
      setState(() {
        imageData = bytes;
      });
    }
  }

  Image? getImageWidget() {
    if (imageData != null) {
      return Image.memory(imageData!);
    } else {
      return null;
    }
  }

  void saveDataToJson() {
    Map<String, dynamic> jsonData = {
      "selectedStats": selectedStats,
      "horseName": horseName,
      // Add other data you want to save
    };

    File jsonFile = File(jsonFilePath);
    jsonFile.writeAsStringSync(json.encode(jsonData));
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color.fromARGB(255, 255, 225, 127),
        elevation: 3,
        backgroundColor: Colors.black,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: ImportantTittle(
          screenSize: screenSize,
          tittleName: 'Registration     ',
        ),
        centerTitle: true,
        leading: const HomeButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(17),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'REGISTRATION',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Lógica para el botón de registrar
                  // Puedes implementar la lógica de registro aquí
                  saveDataToJson();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: const BorderSide(color: Colors.black, width: 1.0),
                  ),
                ),
                child: const Text('GENERATE NEW',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Table(
                  columnWidths: const {0: FlexColumnWidth(2), 1: FlexColumnWidth(3)},
                  children: [
                    TableRow(
                      children: [
                        GestureDetector(
                          onTap: pickImage,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            height: 100,
                            width: 100,
                            child: getImageWidget(),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                for (int i = 0; i < 4; i++)
                                  Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        for (int j = 0; j < 4; j++)
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedStats[i] = j;
                                              });
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.all(15),
                                              width: 35,
                                              height: 35,
                                              child: ClipPath(
                                                clipper: TriangleClipper(),
                                                child: Container(
                                                  color: selectedStats[i] == j
                                                      ? Colors.green
                                                      : Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ),
                                        const Text('Stats'),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ... (rest of your existing code)
