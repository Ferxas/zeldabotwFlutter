import 'package:flutter/material.dart';

class ImportantTittle extends StatelessWidget {
  const ImportantTittle({
    super.key,
    required this.screenSize,
    required this.tittleName,
  });

  final Size screenSize;
  final String tittleName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width,
      height: screenSize.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/black.jpg'), fit: BoxFit.cover),
      ),
      child: Center(
        child: Text(
          tittleName,
          style: TextStyle(
              fontFamily: 'Zelda',
              color: const Color.fromARGB(255, 199, 162, 95),
              fontSize: screenSize.width / 22,
              fontWeight: FontWeight.bold,
              shadows: const <Shadow>[
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 1.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 2.0,
                  color: Color.fromARGB(197, 0, 0, 0),
                )
              ]),
        ),
      ),
    );
  }
}
