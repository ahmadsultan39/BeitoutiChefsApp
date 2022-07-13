// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealsInfoModel _$MealsInfoModelFromJson(Map<String, dynamic> json) =>
    MealsInfoModel(
      json['active_meals'] as int,
      json['total_meals'] as int,
    );

Map<String, dynamic> _$MealsInfoModelToJson(MealsInfoModel instance) =>
    <String, dynamic>{
      'active_meals': instance.activeMeals,
      'total_meals': instance.totalMeals,
    };
