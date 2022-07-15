// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_meal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionMealModel _$SubscriptionMealModelFromJson(
        Map<String, dynamic> json) =>
    SubscriptionMealModel(
      json['id'] as int,
      json['image'] as String,
      json['name'] as String,
      json['price'] as int,
      json['day_number'] as int,
    );

Map<String, dynamic> _$SubscriptionMealModelToJson(
        SubscriptionMealModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'price': instance.price,
      'day_number': instance.dayNumber,
    };
