import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class OrderMealNote extends Equatable {
  final String name;

  @JsonKey(name: 'meal_id')
  final int mealId;

  @JsonKey(name: 'order_id')
  final int orderId;

  @JsonKey(name: 'meal_rate')
  final double? mealRate;

  @JsonKey(name: 'meal_rate_notes')
  final String? mealRateNotes;

  @JsonKey(name: 'prepared_at')
  final String preparedAt;

  const OrderMealNote({
    required this.name,
    required this.mealId,
    required this.orderId,
    required this.mealRate,
    required this.mealRateNotes,
    required this.preparedAt,
  });

  @override
  List<Object?> get props => [
        name,
        mealId,
        orderId,
        mealRate,
        mealRateNotes,
        preparedAt,
      ];
}
