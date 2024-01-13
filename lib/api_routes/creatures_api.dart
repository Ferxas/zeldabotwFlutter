import 'package:jma_app_project/models/creature.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Creature>> apiLoadCreatures() async {
  final uri = Uri.parse(
      "https://botw-compendium.herokuapp.com/api/v3/compendium/category/creatures");
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final jsonCreatureList = json["data"];
  final List<Creature> creatureList = [];
  for (final jsonCreature in jsonCreatureList) {
    final creature = Creature.fromJson(jsonCreature);
    creatureList.add(creature);
  }
  return creatureList;
}