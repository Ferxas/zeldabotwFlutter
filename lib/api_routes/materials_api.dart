import 'package:jma_app_project/models/materials.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Materials>> apiLoadMaterials() async {
  final uri = Uri.parse(
      "https://botw-compendium.herokuapp.com/api/v3/compendium/category/materials");
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final jsonMaterialsList = json["data"];
  final List<Materials> materialsList = [];
  for (final jsonMaterials in jsonMaterialsList) {
    final materials = Materials.fromJson(jsonMaterials);
    materialsList.add(materials);
  }
  return materialsList;
}