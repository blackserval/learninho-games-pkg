import 'package:json_annotation/json_annotation.dart';
import 'assets_model.dart';

part 'game_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GameModel {
  String? page;
  List<AssetsModel>? assets;

  GameModel({this.page, this.assets});

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return _$GameModelFromJson(json);
  }

  Map<String, dynamic> toJosn() => _$GameModelToJson(this);
}
