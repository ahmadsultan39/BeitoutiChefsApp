import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/time_order.dart';
import 'order_meal_model.dart';

part 'time_order_model.g.dart';

@JsonSerializable()
class TimeOrderModel extends TimeOrder {
  static const String className = 'TimeOrderModel';

  factory TimeOrderModel.fromJson(Map<String, dynamic> json) =>
      _$TimeOrderModelFromJson(json);

  @JsonKey(name: "selected_delivery_time")
  final String selectedDeliveryTime;

  @JsonKey(name: "subscription")
  final int? subscriptionId;

  final List<OrderMealModel> meals;

  const TimeOrderModel(int id, this.selectedDeliveryTime, this.subscriptionId,
      String? notes, this.meals,String status)
      : super(id, selectedDeliveryTime, subscriptionId, notes, meals,status);
}
