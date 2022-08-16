// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_meal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderMealModel _$OrderMealModelFromJson(Map<String, dynamic> json) =>
    OrderMealModel(
      json['id'] as int,
      json['chef_id'] as int,
      json['name'] as String,
      json['image'] as String,
      json['notes'] as String?,
      json['price'] as int,
      (json['discount_percentage'] as num?)?.toDouble(),
      json['quantity'] as int,
    );

Map<String, dynamic> _$OrderMealModelToJson(OrderMealModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'notes': instance.notes,
      'price': instance.price,
      'quantity': instance.quantity,
      'chef_id': instance.chefId,
      'discount_percentage': instance.discountPercentage,
    };
