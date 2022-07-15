// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionModel _$SubscriptionModelFromJson(Map<String, dynamic> json) =>
    SubscriptionModel(
      json['id'] as int,
      json['name'] as String,
      json['days_number'] as int,
      json['meal_delivery_time'] as String,
      json['is_available'] as bool,
      json['starts_at'] as String,
      json['max_subscibers'] as int,
      json['meals_cost'] as int,
      json['current_subscribers'] as int,
      (json['meals'] as List<dynamic>)
          .map((e) => SubscriptionMealModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubscriptionModelToJson(SubscriptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'meals': instance.meals,
      'days_number': instance.daysNumber,
      'meal_delivery_time': instance.mealDeliveryTime,
      'is_available': instance.isAvailable,
      'starts_at': instance.startsAt,
      'max_subscibers': instance.maxSubscribers,
      'meals_cost': instance.mealsCost,
      'current_subscribers': instance.currentSubscribers,
    };
