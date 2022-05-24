import 'dart:convert';
SubCategoryModel subCategoryModelFromJson(String str) => SubCategoryModel.fromJson(json.decode(str));
String subCategoryModelToJson(SubCategoryModel data) => json.encode(data.toJson());
class SubCategoryModel {
  SubCategoryModel({
      int? status, 
      int? totalPages, 
      List<SubCategories>? categories,}){
    _status = status;
    _totalPages = totalPages;
    _categories = categories;
}

  SubCategoryModel.fromJson(dynamic json) {
    _status = json['status'];
    _totalPages = json['totalPages'];
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(SubCategories.fromJson(v));
      });
    }
  }
  int? _status;
  int? _totalPages;
  List<SubCategories>? _categories;

  int get status => _status ?? 0;
  int get totalPages => _totalPages ?? 0;
  List<SubCategories> get categories => _categories ?? [];

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

SubCategories categoriesFromJson(String str) => SubCategories.fromJson(json.decode(str));
String categoriesToJson(SubCategories data) => json.encode(data.toJson());
class SubCategories {
  SubCategories({
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

  SubCategories.fromJson(dynamic json) {
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