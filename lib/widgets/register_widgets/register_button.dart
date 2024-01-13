import 'package:flutter/material.dart';
import 'package:jma_app_project/models/game_element.dart';
import 'package:jma_app_project/widgets/compendium_widgets/details_dialog.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.gameElement,
  });

  final GameElement gameElement;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return
          Container(
            width: screenSize.width / 4.5,
            height: screenSize.width / 15,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 230, 183, 97),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      "Generate New",
                      style: TextStyle(
                        fontSize: screenSize.width / 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  iconSize: screenSize.width / 30,
                  onPressed: () {
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return DetailsDialog(gameElement: gameElement);
                      },
                    );
                  },
                  icon: const Icon(Icons.info_outline),
                  color: Colors.white,
                ),
              ],
            ),
    );
  }
}