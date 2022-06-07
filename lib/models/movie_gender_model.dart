class MovieGenderModel {

  MovieGenderModel({
    required this.id,
    required this.name,
    required this.select,
  });

  int id;
  String name;
  bool select;

  factory MovieGenderModel.fromJson(Map<String, dynamic> json) => MovieGenderModel(
    id: json["id"],
    name: json["name"],
    select: false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };


}