// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_times_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersTimesModel _$OrdersTimesModelFromJson(Map<String, dynamic> json) =>
    OrdersTimesModel(
      json['clock'] as String,
      (json['meals'] as List<dynamic>)
          .map((e) => TotalMealModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrdersTimesModelToJson(OrdersTimesModel instance) =>
    <String, dynamic>{
      'clock': instance.clock,
      'meals': instance.meals,
    };
