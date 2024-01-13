import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(255, 21, 4, 0)),
      ),
      child: Icon(Icons.home_filled,
          color: const Color.fromARGB(255, 94, 203, 253),
          shadows: <Shadow>[
            blueLight(),
          ]),
      onPressed: () {
        Navigator.of(context).pushNamed("/");
      },
    );
  }

  Shadow blueLight() {
    return const Shadow(
      blurRadius: 10.0,
      color: Color.fromARGB(255, 45, 195, 255),
    );
  }
}
