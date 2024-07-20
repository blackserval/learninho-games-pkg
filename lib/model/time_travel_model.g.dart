// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_travel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeTravelModel _$TimeTravelModelFromJson(Map<String, dynamic> json) =>
    TimeTravelModel(
      page: json['page'] as String?,
      assets: (json['assets'] as List<dynamic>?)
          ?.map((e) => AssetsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TimeTravelModelToJson(TimeTravelModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'assets': instance.assets?.map((e) => e.toJson()).toList(),
    };
