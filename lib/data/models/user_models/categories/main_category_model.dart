import 'dart:convert';
MainCategoryModel mainCategoryModelFromJson(String str) => MainCategoryModel.fromJson(json.decode(str));
String mainCategoryModelToJson(MainCategoryModel data) => json.encode(data.toJson());
class MainCategoryModel {
  MainCategoryModel({
      int? status,
      int? totalPages,
      List<Categories>? categories,}){
    _status = status;
    _totalPages = totalPages;
    _categories = categories;
}

  MainCategoryModel.fromJson(dynamic json) {
    _status = json['status'];
    _totalPages = json['totalPages'];
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
  }
  int? _status;
  int? _totalPages;
  List<Categories>? _categories;

  int get status => _status ?? 0;
  int get totalPages => _totalPages ?? 0;
  List<Categories> get categories => _categories ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['totalPages'] = _totalPages;
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));
String categoriesToJson(Categories data) => json.encode(data.toJson());
class Categories {
  Categories({
      int? id,
      String? type,
      String? name,
      String? image,

  }){
    _id = id;
    _type = type;
    _name = name;
    _image = image;
}

  Categories.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _name = json['name'];
    _image = json['image'];
  }
  int? _id;
  String? _type;
  String? _name;
  String? _image;

  int get id => _id ?? 0;
  String get type => _type ?? '';
  String get name => _name ?? '';
  String get image => _image ?? '' ;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    map['name'] = _name;
    map['image'] = _image;
    return map;
  }

}