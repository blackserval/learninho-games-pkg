import 'package:json_annotation/json_annotation.dart';

part 'assets_model.g.dart';

@JsonSerializable()
class AssetsModel {
  String? url;
  String? value;

  AssetsModel({this.url, this.value});

  factory AssetsModel.fromJson(Map<String, dynamic> json) =>
      _$AssetsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssetsModelToJson(this);
}
