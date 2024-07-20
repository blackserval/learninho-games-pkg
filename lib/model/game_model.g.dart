// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModel _$GameModelFromJson(Map<String, dynamic> json) => GameModel(
      page: json['page'] as String?,
      assets: (json['assets'] as List<dynamic>?)
          ?.map((e) => AssetsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GameModelToJson(GameModel instance) => <String, dynamic>{
      'page': instance.page,
      'assets': instance.assets?.map((e) => e.toJson()).toList(),
    };
