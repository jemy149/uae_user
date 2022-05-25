import 'dart:convert';
NotificationsModel notificationsModelFromJson(String str) => NotificationsModel.fromJson(json.decode(str));
String notificationsModelToJson(NotificationsModel data) => json.encode(data.toJson());
class NotificationsModel {
  NotificationsModel({
      int? status, 
      int? totalPages, 
      List<Notifications>? notifications,}){
    _status = status;
    _totalPages = totalPages;
    _notifications = notifications;
}

  NotificationsModel.fromJson(dynamic json) {
    _status = json['status'];
    _totalPages = json['totalPages'];
    if (json['notifications'] != null) {
      _notifications = [];
      json['notifications'].forEach((v) {
        _notifications?.add(Notifications.fromJson(v));
      });
    }
  }
  int? _status;
  int? _totalPages;
  List<Notifications>? _notifications;

  int get status => _status ?? 0;
  int get totalPages => _totalPages ?? 0;
  List<Notifications> get notifications => _notifications ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['totalPages'] = _totalPages;
    if (_notifications != null) {
      map['notifications'] = _notifications?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Notifications notificationsFromJson(String str) => Notifications.fromJson(json.decode(str));
String notificationsToJson(Notifications data) => json.encode(data.toJson());
class Notifications {
  Notifications({
      int? id, 
      dynamic title, 
      String? content, 
      bool? isSeen, 
      int? createdAt,}){
    _id = id;
    _title = title;
    _content = content;
    _isSeen = isSeen;
    _createdAt = createdAt;
}

  Notifications.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _content = json['content'];
    _isSeen = json['isSeen'];
    _createdAt = json['createdAt'];
  }
  int? _id;
  dynamic _title;
  String? _content;
  bool? _isSeen;
  int? _createdAt;

  int get id => _id ?? 0;
  dynamic get title => _title ?? [];
  String get content => _content ?? '';
  bool get isSeen => _isSeen ?? false;
  int get createdAt => _createdAt ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['content'] = _content;
    map['isSeen'] = _isSeen;
    map['createdAt'] = _createdAt;
    return map;
  }

}