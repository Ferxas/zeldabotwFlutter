import 'game_element.dart';

class Equipment extends GameElement {
  //String category;
  //String properties;
  // List<dynamic> drops, location;

  Equipment.fromJson(Map<String, dynamic> json)
      :
        //location = json["common_locations"],
        //category = json["category"],
        //properties = json["properties"];
        super.fromJson(json);
}
