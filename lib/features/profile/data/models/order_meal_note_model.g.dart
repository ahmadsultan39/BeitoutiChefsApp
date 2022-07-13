// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_meal_note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderMealNoteModel _$OrderMealNoteModelFromJson(Map<String, dynamic> json) =>
    OrderMealNoteModel(
      name: json['name'] as String,
      mealId: json['meal_id'] as int,
      orderId: json['order_id'] as int,
      mealRate: (json['meal_rate'] as num?)?.toDouble(),
      mealRateNotes: json['meal_rate_notes'] as String?,
      preparedAt: json['prepared_at'] as String,
    );

Map<String, dynamic> _$OrderMealNoteModelToJson(OrderMealNoteModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'meal_id': instance.mealId,
      'order_id': instance.orderId,
      'meal_rate': instance.mealRate,
      'meal_rate_notes': instance.mealRateNotes,
      'prepared_at': instance.preparedAt,
    };
