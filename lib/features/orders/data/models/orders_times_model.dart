
import 'package:beitouti_chefs/features/orders/data/models/total_meal_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/orders_times.dart';

part 'orders_times_model.g.dart';

@JsonSerializable()
class OrdersTimesModel extends OrdersTimes {
  static const String className = 'OrdersTimesModel';

  factory OrdersTimesModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersTimesModelFromJson(json);

  final List<TotalMealModel> meals;

  const OrdersTimesModel(String clock, this.meals) : super(clock, meals);
}
