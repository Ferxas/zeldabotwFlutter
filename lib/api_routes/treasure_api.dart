import 'dart:convert';
import 'package:jma_app_project/models/treasure.dart';
import 'package:http/http.dart' as http;

Future<List<Treasure>> apiLoadTreasures() async {
  final uri = Uri.parse(
      "https://botw-compendium.herokuapp.com/api/v3/compendium/category/treasure");
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final jsonTreasureList = json["data"];
  final List<Treasure> treasureList = [];
  for (final jsonTreasure in jsonTreasureList) {
    final treasure = Treasure.fromJson(jsonTreasure);
    treasureList.add(treasure);
  }
  return treasureList;
}
