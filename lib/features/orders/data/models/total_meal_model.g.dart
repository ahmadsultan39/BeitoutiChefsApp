// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_meal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotalMealModel _$TotalMealModelFromJson(Map<String, dynamic> json) =>
    TotalMealModel(
      json['id'] as int,
      json['chef_id'] as int,
      json['name'] as String,
      json['image'] as String,
      json['quantity'] as int,
    );

Map<String, dynamic> _$TotalMealModelToJson(TotalMealModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'quantity': instance.quantity,
      'chef_id': instance.chefId,
    };
