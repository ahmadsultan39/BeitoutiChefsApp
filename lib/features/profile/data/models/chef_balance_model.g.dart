// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chef_balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChefBalanceModel _$ChefBalanceModelFromJson(Map<String, dynamic> json) =>
    ChefBalanceModel(
      balance: json['balance'] as int,
      today: BalanceModel.fromJson(json['today'] as Map<String, dynamic>),
      thisMonth:
          BalanceModel.fromJson(json['this_month'] as Map<String, dynamic>),
      thisWeek:
          BalanceModel.fromJson(json['this_week'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChefBalanceModelToJson(ChefBalanceModel instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'today': instance.today,
      'this_month': instance.thisMonth,
      'this_week': instance.thisWeek,
    };
