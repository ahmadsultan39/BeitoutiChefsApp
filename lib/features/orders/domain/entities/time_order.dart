import 'package:equatable/equatable.dart';

import 'order_meal.dart';

class TimeOrder extends Equatable {
  final int id;
  final String status;
  final String selectedDeliveryTime;
  final int? subscriptionId;
  final String notes;
  final List<OrderMeal> meals;

  const TimeOrder(this.id, this.selectedDeliveryTime, this.subscriptionId,
      this.notes, this.meals, this.status);

  @override
  List<Object?> get props =>
      [id, selectedDeliveryTime, subscriptionId, notes, meals];
}
