import 'package:beitouti_chefs/features/subscriptions/data/models/subscription_meal_model.dart';
import 'package:equatable/equatable.dart';

class Subscription extends Equatable {
  final int id;
  final String name;
  final int daysNumber;
  final String mealDeliveryTime;
  bool isAvailable;
  final String startsAt;
  final int maxSubscribers;
  final int mealsCost;
  final int currentSubscribers;
  final List<SubscriptionMealModel> meals;

  Subscription(
    this.id,
    this.name,
    this.daysNumber,
    this.mealDeliveryTime,
    this.isAvailable,
    this.startsAt,
    this.maxSubscribers,
    this.mealsCost,
    this.currentSubscribers,
    this.meals,
  );

  void editAvailability(){
    isAvailable = !isAvailable;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        daysNumber,
        mealDeliveryTime,
        isAvailable,
        startsAt,
        maxSubscribers,
        mealsCost,
        currentSubscribers,
        meals
      ];
}
