import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
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
              const SizedBox(height: 16),
              TextField(
                onChanged: (value) {
                  setState(() {
                    horseName = value;
                  });
                },
                decoration: const InputDecoration(labelText: 'Nombre del Caballo'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Lógica para el botón de registrar caballo
                  // Puedes implementar la lógica de registro aquí
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 36, 28, 26),
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                    side: const BorderSide(color: Colors.black, width: 1.0),
                  ),
                ),
                child: const Text('REGISTER',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: screenSize.height * 0.5,
                child: const ShowHorseList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

void main() {
  runApp(const MaterialApp(
    home: RegistrationScreen(),
  ));
}
