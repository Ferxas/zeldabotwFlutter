import 'game_element.dart';

class Treasure extends GameElement {
  //String category;
  // List<dynamic> drops, location;

  Treasure.fromJson(Map<String, dynamic> json)
      :
        //drops = json["drops"],
        //location = json["common_locations"],
        //category = json["category"];
        super.fromJson(json);
}
