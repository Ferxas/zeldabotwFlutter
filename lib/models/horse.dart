import 'package:jma_app_project/models/game_element.dart';

class Horse extends GameElement{
  String stat1;
  String stat2;
  String stat3;
  String stat4;

  Horse.fromJson(Map<String, dynamic> json)

      : stat4 = json["stat4"],
        stat3 = json["stat3"],
        stat2 = json["stat2"],
        stat1 = json["stat1"],
        super.fromJson(json);
}