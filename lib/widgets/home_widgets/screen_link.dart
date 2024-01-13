import 'package:flutter/material.dart';

class ScreenLink extends StatelessWidget {
  const ScreenLink({
    super.key,
    required this.screenSize,
    required this.titleLink,
    required this.descriptionLink,
    required this.iconLink,
    required this.screenRoute,
  });

  final Size screenSize;
  final String titleLink;
  final String descriptionLink;
  final IconData iconLink;
  final String screenRoute;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 35),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 48, 137, 211),
          border: Border(),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(1.0, 1.0),
              blurRadius: 20.0,
              color: Color.fromARGB(131, 40, 212, 255),
            ),
            BoxShadow(
              offset: Offset(2.0, 2.0),
              color: Color.fromARGB(200, 0, 0, 0),
            ),
          ],
          image: DecorationImage(
              image: AssetImage('assets/blue.jpg'),
              fit: BoxFit.cover,
              opacity: 100)),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        width: screenSize.width,
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/divider_blue.png'),
              opacity: AlwaysStoppedAnimation(100),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titleLink,
                          style: TextStyle(
                              fontFamily: 'Zelda',
                              color: const Color.fromARGB(255, 94, 203, 253),
                              fontSize: screenSize.width / 15,
                              shadows: <Shadow>[blueLight()]),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(
                            descriptionLink,
                            style: TextStyle(
                                color: const Color.fromARGB(255, 94, 203, 253),
                                fontSize: screenSize.width / 32,
                                shadows: <Shadow>[blueLight()]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        foregroundColor:
                            const Color.fromARGB(255, 94, 203, 253),
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(30),
                        side: const BorderSide(
                          width: 3,
                          color: Color.fromARGB(255, 94, 203, 253),
                        )),
                    child: Icon(iconLink,
                        size: screenSize.width / 10,
                        shadows: <Shadow>[
                          blueLight(),
                        ]),
                    onPressed: () {
                      Navigator.of(context).pushNamed(screenRoute);
                    },
                  ),
                )
              ],
            ),
            const Image(
              image: AssetImage('assets/divider_blue.png'),
              opacity: AlwaysStoppedAnimation(100),
            ),
          ],
        ),
      ),
    );
  }

  Shadow blueLight() {
    return const Shadow(
      blurRadius: 10.0,
      color: Color.fromARGB(255, 45, 195, 255),
    );
  }
}
