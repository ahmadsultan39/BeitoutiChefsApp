import 'package:beitouti_chefs/features/profile/domain/entities/chef_balance.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chef_balance_model.g.dart';

@JsonSerializable()
class ChefBalanceModel extends ChefBalance {
  static const String className = 'ChefBalanceModel';

  const ChefBalanceModel();

  factory ChefBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$ChefBalanceModelFromJson(json);
}
