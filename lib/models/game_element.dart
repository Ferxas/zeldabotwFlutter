class GameElement {
  int id;
  String name;
  String image;
  String description;

  GameElement.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        image = json["image"],
        id = json["id"],
        description = json["description"];
}
