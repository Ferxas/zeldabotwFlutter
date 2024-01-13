import 'package:jma_app_project/screens/combat_screen.dart';
import 'package:jma_app_project/screens/conpendium_screen.dart';
import 'package:jma_app_project/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:jma_app_project/screens/map_screen.dart';
import 'package:jma_app_project/screens/recipes_screen.dart';
import 'package:jma_app_project/screens/registration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const HomeScreen(),
        "/ConpendiumScreen": (context) => const ConpendiumScreen(),
        "/RegistrationScreen": (context) => const RegistrationScreen(),
        "/MapScreen": (context) => const MapScreen(),
        "/CombatScreen": (context) => const CombatScreen(),
        "/RecipesScreen": (context) => const RecipesScreen(),
      },
    );
  }
}
