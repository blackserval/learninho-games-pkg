// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AssetsModel {
  String? url;
  int? value;

  AssetsModel({this.url, this.value});

  factory AssetsModel.fromMap(Map<String, dynamic> map) {
    return AssetsModel(
      url: map['url'] != null ? map['url'] as String : null,
      value: map['value'] != null ? map['value'] as int : null,
    );
  }

  factory AssetsModel.fromJson(String source) =>
      AssetsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
