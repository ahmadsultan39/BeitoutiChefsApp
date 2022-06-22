import 'package:json_annotation/json_annotation.dart';

import '../entities/meal.dart';

part 'meal_model.g.dart';

@JsonSerializable()
class MealModel extends Meal {
  static const String className = "MealModel";

  final int id;
  @JsonKey(name: "image")
  final String imageUrl;
  final String name;
  @JsonKey(name: "category_id")
  final int categoryId;
  final String ingredients;
  @JsonKey(name: "expected_preparation_time")
  final int preparingTime;
  @JsonKey(name: "max_meals_per_day")
  final int maxMeals;
  final int price;
  @JsonKey(name: "discount_percentage")
  final double? discount;
  @JsonKey(name: "is_available")
  final bool? isAvailable;
  final double? rating;
  @JsonKey(name: "rates_count")
  final int? ratingCount;
  @JsonKey(name: "approved")
  final bool? isApproved;

  MealModel(
    this.id,
    this.imageUrl,
    this.name,
    this.categoryId,
    this.ingredients,
    this.preparingTime,
    this.maxMeals,
    this.price,
    this.discount,
    this.isAvailable,
    this.rating,
    this.ratingCount,
    this.isApproved,
  ) : super(
          id: id,
          imageUrl: imageUrl,
          name: name,
          categoryId: categoryId,
          ingredients: ingredients,
          preparingTime: preparingTime,
          maxMeals: maxMeals,
          price: price,
          discount: discount,
          isAvailable: isAvailable,
          rating: rating,
          ratingCount: ratingCount,
          isApproved: isApproved,
        );

  factory MealModel.fromJson(Map<String, dynamic> json) =>
      _$MealModelFromJson(json);
}
