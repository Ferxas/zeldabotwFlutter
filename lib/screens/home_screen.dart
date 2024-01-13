import 'package:flutter/material.dart';
import 'package:jma_app_project/widgets/home_widgets/app_intro_section.dart';
import 'package:jma_app_project/widgets/home_widgets/arrow_divider.dart';
import 'package:jma_app_project/widgets/home_widgets/screen_link.dart';

const double backgroundPhotoHeight = 350;

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: backgroundPhotoHeight + 20,
              width: screenSize.width,
              child: const Image(
                image: AssetImage('assets/hyrule_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          AppIntroSection(screenSize: screenSize),
          SizedBox(
            width: screenSize.width,
            height: screenSize.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: backgroundPhotoHeight,
                    width: screenSize.width,
                  ),
                  Container(
                    padding: const EdgeInsets.all(30),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage('assets/black.jpg'),
                            repeat: ImageRepeat.repeat),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            blurRadius: 10.0,
                            color: Color.fromARGB(200, 0, 0, 0),
                          ),
                        ]),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              const ArrowDivider(
                                dividerTitle: 'Original Screens',
                              ),
                              ScreenLink(
                                screenSize: screenSize,
                                titleLink: 'Compendium',
                                descriptionLink:
                                    'Small encyclopedia with all the elements of the game',
                                iconLink: Icons.menu_book,
                                screenRoute: "/ConpendiumScreen",
                              ),
                              ScreenLink(
                                screenSize: screenSize,
                                titleLink: 'Registration',
                                descriptionLink:
                                    'Random horse generator with registration and query option',
                                iconLink: Icons.edit_square,
                                screenRoute: "/RegistrationScreen",
                              ),
                              ScreenLink(
                                screenSize: screenSize,
                                titleLink: 'Map',
                                descriptionLink:
                                    'Zelda BOTW game interactive map with game item locator',
                                iconLink: Icons.map,
                                screenRoute: "/MapScreen",
                              ),
                              const ArrowDivider(
                                dividerTitle: 'Zelda Simulators',
                              ),
                              ScreenLink(
                                screenSize: screenSize,
                                titleLink: 'Combat',
                                descriptionLink:
                                    'Combat simulation to test the statistics of different equipment',
                                iconLink: Icons.shield_moon_outlined,
                                screenRoute: "/CombatScreen",
                              ),
                              ScreenLink(
                                screenSize: screenSize,
                                titleLink: 'Recipes',
                                descriptionLink:
                                    'Cooking simulator that allows you to create different recipes using the game materials',
                                iconLink: Icons.dining_outlined,
                                screenRoute: "/RecipesScreen",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
