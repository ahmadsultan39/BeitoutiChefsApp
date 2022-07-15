import 'package:beitouti_chefs/features/subscriptions/domain/entities/subscription_meal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subscription_meal_model.g.dart';

@JsonSerializable()
class SubscriptionMealModel extends SubscriptionMeal {
  static const String className = "SubscriptionMealModel";

  factory SubscriptionMealModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionMealModelFromJson(json);

  @JsonKey(name: "day_number")
  final int dayNumber;

  const SubscriptionMealModel(
    int id,
    String image,
    String name,
    int price,
    this.dayNumber,
  ) : super(
          id,
          image,
          name,
          price,
          dayNumber,
        );
}

