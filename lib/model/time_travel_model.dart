import 'package:json_annotation/json_annotation.dart';
import 'assets_model.dart';

part 'time_travel_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TimeTravelModel {
  String? page;
  List<AssetsModel>? assets;

  TimeTravelModel({this.page, this.assets});

  factory TimeTravelModel.fromJson(Map<String, dynamic> json) =>
      _$TimeTravelModelFromJson(json);

  Map<String, dynamic> toJson() => _$TimeTravelModelToJson(this);
}
