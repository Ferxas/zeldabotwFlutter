import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jma_app_project/models/game_element.dart';

Future<List<GameElement>> apiLoadAll() async {
  final uri =
      Uri.parse("https://botw-compendium.herokuapp.com/api/v3/compendium/all");
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final jsonAllElementsList = json["data"];
  final List<GameElement> allElementsList = [];
  for (final jsonAllElements in jsonAllElementsList) {
    final allElements = GameElement.fromJson(jsonAllElements);
    allElementsList.add(allElements);
  }
  return allElementsList;
}
