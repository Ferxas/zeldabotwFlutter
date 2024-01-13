import 'package:jma_app_project/models/equipment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Equipment>> apiLoadEquipment() async {
  final uri = Uri.parse(
      "https://botw-compendium.herokuapp.com/api/v3/compendium/category/equipment");
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final jsonEquipmentList = json["data"];
  final List<Equipment> equipmentList = [];
  for (final jsonEquipment in jsonEquipmentList) {
    final equipment = Equipment.fromJson(jsonEquipment);
    equipmentList.add(equipment);
  }
  return equipmentList;
}