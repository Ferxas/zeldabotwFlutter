import 'package:flutter/material.dart';

class QuitButton extends StatelessWidget {
  const QuitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      backgroundColor: const Color.fromARGB(255, 94, 203, 253),
      mini: true,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 21, 4, 0), shape: BoxShape.circle),
        child: const Icon(
          Icons.close,
          color: Color.fromARGB(255, 94, 203, 253),
          shadows: [
            Shadow(
              blurRadius: 10.0,
              color: Color.fromARGB(255, 45, 195, 255),
            )
          ],
        ),
      ),
    );
  }
}
