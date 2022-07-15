import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/total_meal.dart';

part 'total_meal_model.g.dart';


@JsonSerializable()
class TotalMealModel extends TotalMeal {
  static const String className = 'TotalMealModel';

  factory TotalMealModel.fromJson(Map<String, dynamic> json) =>
      _$TotalMealModelFromJson(json);

  @JsonKey(name: "chef_id")
  final int chefId;

  TotalMealModel(
    int id,
    this.chefId,
    String name,
    String image,
    int quantity,
  ) : super(
          id,
          chefId,
          name,
          image,
          quantity,
        );
}
