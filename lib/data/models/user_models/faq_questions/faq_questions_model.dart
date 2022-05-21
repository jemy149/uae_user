import 'dart:convert';
FaqQuestionsModel faqQuestionsModelFromJson(String str) => FaqQuestionsModel.fromJson(json.decode(str));
String faqQuestionsModelToJson(FaqQuestionsModel data) => json.encode(data.toJson());
class FaqQuestionsModel {
  FaqQuestionsModel({
      int? status, 
      int? totalPages, 
      List<Faqs>? faqs,}){
    _status = status;
    _totalPages = totalPages;
    _faqs = faqs;
}

  FaqQuestionsModel.fromJson(dynamic json) {
    _status = json['status'];
    _totalPages = json['totalPages'];
    if (json['faqs'] != null) {
      _faqs = [];
      json['faqs'].forEach((v) {
        _faqs?.add(Faqs.fromJson(v));
      });
    }
  }
  int? _status;
  int? _totalPages;
  List<Faqs>? _faqs;

  int get status => _status ?? 0;
  int get totalPages => _totalPages ?? 0;
  List<Faqs> get faqs => _faqs ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['totalPages'] = _totalPages;
    if (_faqs != null) {
      map['faqs'] = _faqs?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Faqs faqsFromJson(String str) => Faqs.fromJson(json.decode(str));
String faqsToJson(Faqs data) => json.encode(data.toJson());
class Faqs {
  Faqs({
      int? id, 
      String? question, 
      String? answer,}){
    _id = id;
    _question = question;
    _answer = answer;
}

  Faqs.fromJson(dynamic json) {
    _id = json['id'];
    _question = json['question'];
    _answer = json['answer'];
  }
  int? _id;
  String? _question;
  String? _answer;

  int get id => _id ?? 0;
  String get question => _question ?? '';
  String get answer => _answer ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['question'] = _question;
    map['answer'] = _answer;
    return map;
  }

}