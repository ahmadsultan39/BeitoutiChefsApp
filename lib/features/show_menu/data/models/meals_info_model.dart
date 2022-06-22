import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/meals_info.dart';

part 'meals_info_model.g.dart';

@JsonSerializable()
class MealsInfoModel extends MealsInfo {
  static const String className = "MealsInfoModel";

  @JsonKey(name: "active_meals")
  final int activeMeals;
  @JsonKey(name: "total_meals")
  final int totalMeals;

  MealsInfoModel(this.activeMeals, this.totalMeals) : super(activeMeals, totalMeals);

  factory MealsInfoModel.fromJson(Map<String, dynamic> json) =>
      _$MealsInfoModelFromJson(json);
}