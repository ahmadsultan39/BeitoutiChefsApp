import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../util/enums.dart';
import 'order_meal.dart';

class OrderEntity extends Equatable {
  final int id;
  final String? notes;
  final OrderStatus status;
  final List<OrderMeal>? meals;

  @JsonKey(name: 'subscription_id')
  final int? subscriptionId;

  @JsonKey(name: 'can_be_canceled')
  final bool? canBeCanceled;

  @JsonKey(name: 'can_be_evaluated')
  final bool? canBeEvaluated;

  @JsonKey(name: 'chef_name')
  final String chefName;

  @JsonKey(name: 'chef_image')
  final String? chefImage;

  @JsonKey(name: 'selected_delivery_time')
  final String selectedDeliveryTime;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'total_cost')
  final dynamic totalCost;

  @JsonKey(name: 'delivery_fee')
  final dynamic deliveryFee;

  const OrderEntity({
    required this.id,
    required this.notes,
    required this.status,
    required this.subscriptionId,
    required this.canBeCanceled,
    required this.canBeEvaluated,
    required this.chefName,
    required this.chefImage,
    required this.selectedDeliveryTime,
    required this.createdAt,
    required this.totalCost,
    required this.deliveryFee,
    required this.meals,
  });

  @override
  List<Object?> get props => [
        id,
        notes,
        status,
        subscriptionId,
        canBeCanceled,
        canBeEvaluated,
        chefName,
        chefImage,
        selectedDeliveryTime,
        createdAt,
        totalCost,
        deliveryFee,
        meals,
      ];
}
