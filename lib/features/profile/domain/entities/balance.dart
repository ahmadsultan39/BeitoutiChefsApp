import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class Balance extends Equatable {
  final int balance;
  @JsonKey(name: 'recieved')
  final int received;
  @JsonKey(name: 'orders_count')
  final int ordersCount;

  const Balance({
    required this.balance,
    required this.received,
    required this.ordersCount,
  });

  @override
  List<Object?> get props => [balance, received, ordersCount];
}
