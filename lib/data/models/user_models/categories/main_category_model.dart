import 'dart:convert';

MainCategoryModel mainCategoryModelFromJson(String str) => MainCategoryModel.fromJson(json.decode(str));

String mainCategoryModelToJson(MainCategoryModel data) => json.encode(data.toJson());

class MainCategoryModel {
  MainCategoryModel({
    this.status,
    this.totalPages,
    this.categories,
  });

  int? status;
  int? totalPages;
  List<Category>? categories;

  factory MainCategoryModel.fromJson(Map<String, dynamic> json) => MainCategoryModel(
    status: json["status"],
    totalPages: json["totalPages"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalPages": totalPages,
    "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    this.id,
    this.type,
    this.name,
    this.image,
  });

  int? id;
  Type? type;
  String? name;
  String? image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    type: typeValues.map[json["type"]],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": typeValues.reverse![type],
    "name": name,
    "image": image,
  };
}

enum Type { MAIN_CATEGORY }

final typeValues = EnumValues({
  "mainCategory": Type.MAIN_CATEGORY
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
