import 'package:beitouti_chefs/features/orders/domain/entities/total_meal.dart';
import 'package:equatable/equatable.dart';

class OrdersTimes extends Equatable {
  final String clock;
  final List<TotalMeal> meals;

  const OrdersTimes(this.clock, this.meals);

  @override
  List<Object?> get props => [clock,meals];

}