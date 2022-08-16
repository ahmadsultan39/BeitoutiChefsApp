import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/order_meal.dart';

part 'order_meal_model.g.dart';

@JsonSerializable()
class OrderMealModel extends OrderMeal {
  static const String className = 'OrderMealModel';

  @JsonKey(name: "chef_id")
  final int chefId;

  @JsonKey(name: "discount_percentage")
  final double? discountPercentage;

  const OrderMealModel(
    int id,
    this.chefId,
    String name,
    String image,
    String? notes,
    int price,
    this.discountPercentage,
    int quantity,
  ) : super(
          id,
          chefId,
          name,
          image,
          price,
          discountPercentage,
          notes,
          quantity,
        );

  factory OrderMealModel.fromJson(Map<String, dynamic> json) =>
      _$OrderMealModelFromJson(json);
}
