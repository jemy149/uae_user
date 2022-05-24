import 'dart:convert';
ClearCartModel clearCartModelFromJson(String str) => ClearCartModel.fromJson(json.decode(str));
String clearCartModelToJson(ClearCartModel data) => json.encode(data.toJson());
class ClearCartModel {
  ClearCartModel({
      int? status,}){
    _status = status;
}

  ClearCartModel.fromJson(dynamic json) {
    _status = json['status'];
  }
  int? _status;

  int get status => _status ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    return map;
  }

}