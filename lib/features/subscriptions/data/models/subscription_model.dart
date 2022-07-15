import 'package:beitouti_chefs/features/subscriptions/data/models/subscription_meal_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/subscription.dart';

part 'subscription_model.g.dart';

@JsonSerializable()
class SubscriptionModel extends Subscription {
  static const String className = "SubscriptionModel";

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionModelFromJson(json);

  @JsonKey(name: "days_number")
  final int daysNumber;
  @JsonKey(name: "meal_delivery_time")
  final String mealDeliveryTime;
  @JsonKey(name: "is_available")
  final bool isAvailable;
  @JsonKey(name: "starts_at")
  final String startsAt;
  @JsonKey(name: "max_subscibers")
  final int maxSubscribers;
  @JsonKey(name: "meals_cost")
  final int mealsCost;
  @JsonKey(name: "current_subscribers")
  final int currentSubscribers;

  SubscriptionModel(
      int id,
      String name,
      this.daysNumber,
      this.mealDeliveryTime,
      this.isAvailable,
      this.startsAt,
      this.maxSubscribers,
      this.mealsCost,
      this.currentSubscribers,
      List<SubscriptionMealModel> meals)
      : super(
          id,
          name,
          daysNumber,
          mealDeliveryTime,
          isAvailable,
          startsAt,
          maxSubscribers,
          mealsCost,
          currentSubscribers,
          meals,
        );
}
