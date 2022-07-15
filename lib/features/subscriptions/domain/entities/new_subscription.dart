import 'package:equatable/equatable.dart';

class NewSubscription extends Equatable {
  final int? id;
  final String name;
  final int daysNumber;
  final List<int> mealsIds;
  final String startsAt;
  final String mealDeliveryTime;
  final int maxSubscribers;
  final int mealsCost;

  const NewSubscription(
    this.name,
    this.daysNumber,
    this.mealsIds,
    this.startsAt,
    this.mealDeliveryTime,
    this.maxSubscribers,
    this.mealsCost, this.id,
  );

  @override
  List<Object?> get props => [
        name,
        daysNumber,
        mealsIds,
        startsAt,
        mealDeliveryTime,
        maxSubscribers,
        mealsCost,
      ];
}
