import 'package:flutter/material.dart';

class SearchListElement extends StatefulWidget {
  const SearchListElement({Key? key}) : super(key: key);

  @override
  State<SearchListElement> createState() => _SearchListElementState();
}

class _SearchListElementState extends State<SearchListElement> {
  TextEditingController controller = TextEditingController();
  String results = '';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Row(
            children: [
              SizedBox(
                width: screenSize.width / 12,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(14),
                  width: 300,
                  child: TextField(
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(64, 0, 0, 0),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 199, 162, 95)),
                      ),
                    ),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 94, 203, 253),
                        shadows: <Shadow>[
                          Shadow(
                            blurRadius: 10.0,
                            color: Color.fromARGB(255, 45, 195, 255),
                          )
                        ]),
                    textAlign: TextAlign.center,
                    cursorColor: const Color.fromARGB(255, 94, 203, 253),
                    controller: controller,
                    onChanged: (text) {
                      text = results;
                      debugPrint("text = '$results}'");
                    },
                  ),
                ),
              ),
              SizedBox(
                width: screenSize.width / 12,
                child: Center(
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    color: const Color.fromARGB(255, 199, 162, 95),
                    onPressed: () {
                      controller.text = '';
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
