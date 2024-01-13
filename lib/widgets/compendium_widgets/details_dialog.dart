import 'package:flutter/material.dart';
import 'package:jma_app_project/models/game_element.dart';
import 'package:jma_app_project/widgets/compendium_widgets/details_tittle.dart';
import 'package:jma_app_project/widgets/general_widgets/quit_button.dart';

class DetailsDialog extends StatelessWidget {
  const DetailsDialog({
    super.key,
    required this.gameElement,
  });

  final GameElement gameElement;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return AlertDialog(
      contentPadding: const EdgeInsets.all(3),
      backgroundColor: const Color.fromARGB(255, 21, 4, 0),
      content: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            image: const DecorationImage(
                image: AssetImage('assets/black.jpg'), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Text(
                      gameElement.name,
                      style: TextStyle(
                        fontFamily: 'Zelda',
                        color: const Color.fromARGB(255, 199, 162, 95),
                        fontSize: screenSize.width / 22,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const QuitButton()
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 21, 4, 0),
                  border: Border.all(
                    color: const Color.fromARGB(255, 199, 162, 95),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
                margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(255, 199, 162, 95),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            margin: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                            child: Image(
                              image: NetworkImage(gameElement.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DetailsTittle(
                                screenSize: screenSize,
                                tittle: 'Description:',
                              ),
                              Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(5),
                                child: Text(gameElement.description,
                                    style: TextStyle(
                                        fontSize: screenSize.width / 36,
                                        color: const Color.fromARGB(
                                            255, 94, 203, 253),
                                        shadows: const <Shadow>[
                                          Shadow(
                                            blurRadius: 10.0,
                                            color: Color.fromARGB(
                                                255, 45, 195, 255),
                                          )
                                        ])),
                              ),
                            ],
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
