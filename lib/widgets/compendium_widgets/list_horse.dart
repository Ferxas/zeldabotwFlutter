import 'package:flutter/material.dart';
import 'package:jma_app_project/models/game_element.dart';

class ListHorse extends StatelessWidget {
  const ListHorse({
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
                width: screenSize.width / 2,
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
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
