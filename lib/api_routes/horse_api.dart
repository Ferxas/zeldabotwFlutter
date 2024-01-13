import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:jma_app_project/models/horse.dart';

Future<List<Horse>> apiLoadHorses() async {
  try {
    final jsonString = await rootBundle.loadString('data/horses.json');
    final jsonHorseList = jsonDecode(jsonString)["data"];
    final List<Horse> horseList = [];

    for (final jsonHorse in jsonHorseList) {
      final horse = Horse.fromJson(jsonHorse);
      horseList.add(horse);
    }

    return horseList;
  } catch (e) {
    print('Error al leer el archivo local: $e');
    return []; // O maneja el error de otra manera según tus necesidades
  }
}
