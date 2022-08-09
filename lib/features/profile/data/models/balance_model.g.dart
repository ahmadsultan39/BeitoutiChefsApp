// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalanceModel _$BalanceModelFromJson(Map<String, dynamic> json) => BalanceModel(
      balance: json['balance'] as int,
      received: json['recieved'] as int,
      ordersCount: json['orders_count'] as int,
    );

Map<String, dynamic> _$BalanceModelToJson(BalanceModel instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'recieved': instance.received,
      'orders_count': instance.ordersCount,
    };
