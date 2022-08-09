import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/balance.dart';

part 'balance_model.g.dart';

@JsonSerializable()
class BalanceModel extends Balance {
  static const String className = 'BalanceModel';

  const BalanceModel({
    required int balance,
    required int recieved,
    required int ordersCount,
  }) : super(
          balance: balance,
          received: recieved,
          ordersCount: ordersCount,
        );

  factory BalanceModel.fromJson(Map<String, dynamic> json) =>
      _$BalanceModelFromJson(json);
}
