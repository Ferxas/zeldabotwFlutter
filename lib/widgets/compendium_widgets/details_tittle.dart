import 'package:flutter/material.dart';

class DetailsTittle extends StatelessWidget {
  const DetailsTittle({
    super.key,
    required this.screenSize,
    required this.tittle,
  });

  final Size screenSize;
  final String tittle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Text(tittle,
          style: TextStyle(
              fontFamily: 'MedulaOne',
              fontSize: screenSize.width / 20,
              color: const Color.fromARGB(255, 94, 203, 253),
              shadows: const <Shadow>[
                Shadow(
                  blurRadius: 10.0,
                  color: Color.fromARGB(255, 45, 195, 255),
                )
              ])),
    );
  }
}
