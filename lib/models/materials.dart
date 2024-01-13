import 'game_element.dart';

class Materials extends GameElement {
  //String category;
  //String cooking_effect;
  //float hearts_recovered;
  // List<dynamic> drops, location;

  Materials.fromJson(Map<String, dynamic> json)
      :
        //location = json["common_locations"],
        //category = json["category"],
        //cooking_effect = json["cooking_effect"],
        //hearts_recovered = json["hearts_recovered"],
        //properties = json["properties"];
        super.fromJson(json);
}
