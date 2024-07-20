// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'assets_model.dart';

class GameModel {
  String? page;
  List<AssetsModel>? assets;

  GameModel({this.page, this.assets});

  factory GameModel.fromMap(Map<String, dynamic> map) {
    return GameModel(
      page: map['page'] != null ? map['page'] as String : null,
      assets: map['assets'] != null
          ? List<AssetsModel>.from(
              (map['assets'] as List<dynamic>).map<AssetsModel?>(
                (x) => AssetsModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  factory GameModel.fromJson(String source) =>
      GameModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
