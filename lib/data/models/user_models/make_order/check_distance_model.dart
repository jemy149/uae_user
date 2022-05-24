import 'dart:convert';
CheckDistanceModel checkDistanceModelFromJson(String str) => CheckDistanceModel.fromJson(json.decode(str));
String checkDistanceModelToJson(CheckDistanceModel data) => json.encode(data.toJson());
class CheckDistanceModel {
  CheckDistanceModel({
      int? status,
    num? deliveryPrice,
    num? distance,
      String? message,
    num? maxRange,}){
    _status = status;
    _deliveryPrice = deliveryPrice;
    _distance = distance;
    _message = message;
    _maxRange = maxRange;
}

  CheckDistanceModel.fromJson(dynamic json) {
    _status = json['status'];
    _deliveryPrice = json['deliveryPrice'];
    _distance = json['distance'];
    _message = json['message'];
    _maxRange = json['maxRange'];
  }
  int? _status;
  num? _deliveryPrice;
  num? _distance;
  String? _message;
  num? _maxRange;

  int get status => _status??0;
  num get deliveryPrice => _deliveryPrice??0;
  num get distance => _distance??0;
  String get message => _message??"";
  num get maxRange => _maxRange??0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['deliveryPrice'] = _deliveryPrice;
    map['distance'] = _distance;
    map['message'] = _message;
    map['maxRange'] = _maxRange;
    return map;
  }

}