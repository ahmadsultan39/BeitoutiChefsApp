import 'package:json_annotation/json_annotation.dart';

import '../../../../core/util/enums.dart';
import '../../domain/entities/prepared_order.dart';

part 'prepared_order_model.g.dart';

@JsonSerializable()
class PreparedOrderModel extends PreparedOrder {
  static const String className = 'PreparedOrderModel';

  const PreparedOrderModel({
    required int id,
    required String type,
    required OrderStatus status,
    required int mealsCost,
    required int paidToChef,
    required String? preparedAt,
  }) : super(
          id: id,
          type: type,
          status: status,
          mealsCost: mealsCost,
          paidToChef: paidToChef,
          preparedAt: preparedAt,
        );

  factory PreparedOrderModel.fromJson(Map<String, dynamic> json) =>
      _$PreparedOrderModelFromJson(json);
}
