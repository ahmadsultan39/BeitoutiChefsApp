import 'package:beitouti_chefs/core/util/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class PreparedOrder extends Equatable {
  final int id;

  final String type;

  final OrderStatus status;

  @JsonKey(name: 'meals_cost')
  final int mealsCost;

  @JsonKey(name: 'paid_to_chef')
  final int paidToChef;

  @JsonKey(name: 'prepared_at')
  final String? preparedAt;

  const PreparedOrder({
    required this.id,
    required this.type,
    required this.status,
    required this.mealsCost,
    required this.paidToChef,
    required this.preparedAt,
  });

  @override
  List<Object?> get props => [
        id,
        type,
        status,
        mealsCost,
        paidToChef,
        preparedAt,
      ];
}
