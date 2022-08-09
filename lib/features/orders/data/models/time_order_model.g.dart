// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeOrderModel _$TimeOrderModelFromJson(Map<String, dynamic> json) =>
    TimeOrderModel(
      json['id'] as int,
      json['selected_delivery_time'] as String,
      json['subscription'] as int?,
      json['notes'] as String?,
      (json['meals'] as List<dynamic>)
          .map((e) => OrderMealModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['status'] as String,
    );

Map<String, dynamic> _$TimeOrderModelToJson(TimeOrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'notes': instance.notes,
      'selected_delivery_time': instance.selectedDeliveryTime,
      'subscription': instance.subscriptionId,
      'meals': instance.meals,
    };
