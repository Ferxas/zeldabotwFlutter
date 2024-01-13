import 'package:flutter/material.dart';

class ArrowDivider extends StatelessWidget {
  const ArrowDivider({
    super.key,
    required this.dividerTitle,
  });

  final String dividerTitle;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dividerTitle,
          style: TextStyle(
            fontFamily: 'MedulaOne',
            color: Colors.white,
            fontSize: screenSize.width / 12,
          ),
        ),
        Row(
          children: [
            Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                width: screenSize.width / 2,
                height: 3,
                color: const Color.fromARGB(255, 172, 147, 94)),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 30),
              height: 5,
              child: Transform.flip(
                flipX: true,
                child: const Image(
                  image: AssetImage('assets/arrow_decoration_tip.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
