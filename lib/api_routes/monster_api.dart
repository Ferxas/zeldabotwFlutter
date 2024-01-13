import 'dart:convert';
import 'package:jma_app_project/models/monster.dart';
import 'package:http/http.dart' as http;

Future<List<Monster>> apiLoadMonsters() async {
  final uri = Uri.parse(
      "https://botw-compendium.herokuapp.com/api/v3/compendium/category/monsters");
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final jsonMonsterList = json["data"];
  final List<Monster> monsterList = [];
  for (final jsonMonster in jsonMonsterList) {
    final monster = Monster.fromJson(jsonMonster);
    monsterList.add(monster);
  }
  return monsterList;
}
