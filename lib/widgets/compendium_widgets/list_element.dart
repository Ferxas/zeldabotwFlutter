import 'package:flutter/material.dart';
import 'package:jma_app_project/models/game_element.dart';
import 'package:jma_app_project/widgets/compendium_widgets/details_dialog.dart';

class ListElement extends StatelessWidget {
  const ListElement({
    super.key,
    required this.gameElement,
  });

  final GameElement gameElement;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.fromLTRB(6, 3, 6, 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              image: AssetImage('assets/white.jpg'), fit: BoxFit.cover),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              blurRadius: 1.0,
              color: Color.fromARGB(100, 0, 0, 0),
            )
          ]),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 199, 162, 95),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(3),
            ),
            margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
            height: screenSize.height / 12,
            child: Image(
              image: NetworkImage(gameElement.image),
              fit: BoxFit.cover, // O ajusta según tus necesidades
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: screenSize.width / 3,
                margin: const EdgeInsets.all(5),
                child: Text(
                  gameElement.name,
                  style: TextStyle(
                    fontFamily: 'Zelda',
                    color: const Color.fromARGB(255, 199, 162, 95),
                    fontSize: screenSize.width / 25,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: Text(
                  (gameElement.id).toString(),
                  style: TextStyle(
                    fontFamily: 'Zelda',
                    color: const Color.fromARGB(255, 77, 169, 255),
                    fontSize: screenSize.width / 30,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
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
                      "More Info",
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
          ),
        ],
      ),
    );
  }
}
