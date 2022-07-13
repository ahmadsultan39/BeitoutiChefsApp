import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/add_subscription_meal.dart';

part 'add_subscription_meal_model.g.dart';

@JsonSerializable()
class AddSubscriptionMealModel extends AddSubscriptionMeal{

  static const String className = "AddSubscriptionMealModel";

  factory AddSubscriptionMealModel.fromJson(Map<String, dynamic> json) =>
      _$AddSubscriptionMealModelFromJson(json);

  const AddSubscriptionMealModel(int id,String name) : super(id, name);
}