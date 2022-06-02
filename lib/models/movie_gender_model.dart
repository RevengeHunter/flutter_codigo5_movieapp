class MovieGenderModel {

  MovieGenderModel({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory MovieGenderModel.fromJson(Map<String, dynamic> json) => MovieGenderModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };


}