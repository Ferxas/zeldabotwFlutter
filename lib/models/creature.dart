import 'game_element.dart';

class Creature extends GameElement {
  //String category;
  //bool edible;
  // List<dynamic> drops, location;

  Creature.fromJson(Map<String, dynamic> json)
      :
        //location = json["common_locations"],
        //edible = json["edible"],
        //category = json["category"],
        //drops = json["drops"],
        super.fromJson(json);
}
