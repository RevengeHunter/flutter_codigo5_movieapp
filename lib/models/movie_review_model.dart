// class MovieReviewModel {
//   MovieReviewModel({
//     required this.results,
//   });
//
//   List<Result> results;
//
//   factory MovieReviewModel.fromJson(Map<String, dynamic> json) => MovieReviewModel(
//     results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "results": List<dynamic>.from(results.map((x) => x.toJson())),
//   };
// }

class MovieReviewModel {
  MovieReviewModel({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });

  String author;
  AuthorDetails authorDetails;
  String content;
  DateTime createdAt;
  String id;
  DateTime updatedAt;
  String url;

  factory MovieReviewModel.fromJson(Map<String, dynamic> json) => MovieReviewModel(
    author: json["author"],
    authorDetails: AuthorDetails.fromJson(json["author_details"]),
    content: json["content"],
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "author": author,
    "author_details": authorDetails.toJson(),
    "content": content,
    "created_at": createdAt.toIso8601String(),
    "id": id,
    "updated_at": updatedAt.toIso8601String(),
    "url": url,
  };
}

class AuthorDetails {
  AuthorDetails({
    required this.name,
    required this.username,
    required this.avatarPath,
    required this.rating,
  });

  String name;
  String username;
  String avatarPath;
  int rating;

  factory AuthorDetails.fromJson(Map<String, dynamic> json) => AuthorDetails(
    name: json["name"],
    username: json["username"],
    avatarPath: json["avatar_path"] ?? "",
    rating: json["rating"] == null ? 0 : json["rating"].toInt(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "username": username,
    "avatar_path": avatarPath,
    "rating": rating,
  };
}
