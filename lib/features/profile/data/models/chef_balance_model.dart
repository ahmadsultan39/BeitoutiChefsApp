import 'package:beitouti_chefs/features/profile/data/models/balance_model.dart';
import 'package:beitouti_chefs/features/profile/domain/entities/chef_balance.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chef_balance_model.g.dart';

@JsonSerializable()
class ChefBalanceModel extends ChefBalance {
  static const String className = 'ChefBalanceModel';

  final BalanceModel today;

  @JsonKey(name: 'this_month')
  final BalanceModel thisMonth;

  @JsonKey(name: 'this_week')
  final BalanceModel thisWeek;

  const ChefBalanceModel({
    required int balance,
    required this.today,
    required this.thisMonth,
    required this.thisWeek,
  }) : super(
          balance: balance,
          thisMonth: thisMonth,
          thisWeek: thisWeek,
          today: today,
        );

  factory ChefBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$ChefBalanceModelFromJson(json);
}
