import 'dart:convert';
GetBrandsModel getBrandsModelFromJson(String str) => GetBrandsModel.fromJson(json.decode(str));
String getBrandsModelToJson(GetBrandsModel data) => json.encode(data.toJson());
class GetBrandsModel {
  GetBrandsModel({
      int? status, 
      int? totalPages, 
      List<Brands>? brands,}){
    _status = status;
    _totalPages = totalPages;
    _brands = brands;
}

  GetBrandsModel.fromJson(dynamic json) {
    _status = json['status'];
    _totalPages = json['totalPages'];
    if (json['brands'] != null) {
      _brands = [];
      json['brands'].forEach((v) {
        _brands?.add(Brands.fromJson(v));
      });
    }
  }
  int? _status;
  int? _totalPages;
  List<Brands>? _brands;

  int get status => _status ?? 0;
  int get totalPages => _totalPages ?? 0;
  List<Brands> get brands => _brands ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['totalPages'] = _totalPages;
    if (_brands != null) {
      map['brands'] = _brands?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Brands brandsFromJson(String str) => Brands.fromJson(json.decode(str));
String brandsToJson(Brands data) => json.encode(data.toJson());
class Brands {
  Brands({
      int? id, 
      String? nameAr,}){
    _id = id;
    _nameAr = nameAr;
}

  Brands.fromJson(dynamic json) {
    _id = json['id'];
    _nameAr = json['nameAr'];
  }
  int? _id;
  String? _nameAr;

  int get id => _id ?? 0;
  String get nameAr => _nameAr ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['nameAr'] = _nameAr;
    return map;
  }

}