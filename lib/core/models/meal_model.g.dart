// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealModel _$MealModelFromJson(Map<String, dynamic> json) => MealModel(
      json['id'] as int,
      json['image'] as String,
      json['name'] as String,
      json['category_id'] as int,
      json['ingredients'] as String,
      json['expected_preparation_time'] as int,
      json['max_meals_per_day'] as int,
      json['price'] as int,
      (json['discount_percentage'] as num?)?.toDouble(),
      json['is_available'] as bool?,
      (json['rating'] as num?)?.toDouble(),
      json['rates_count'] as int?,
      json['approved'] as bool?,
    );

Map<String, dynamic> _$MealModelToJson(MealModel instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.imageUrl,
      'name': instance.name,
      'category_id': instance.categoryId,
      'ingredients': instance.ingredients,
      'expected_preparation_time': instance.preparingTime,
      'max_meals_per_day': instance.maxMeals,
      'price': instance.price,
      'discount_percentage': instance.discount,
      'is_available': instance.isAvailable,
      'rating': instance.rating,
      'rates_count': instance.ratingCount,
      'approved': instance.isApproved,
    };
