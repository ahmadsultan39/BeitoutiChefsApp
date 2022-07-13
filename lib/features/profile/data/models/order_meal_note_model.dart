import 'package:beitouti_chefs/features/profile/domain/entities/order_meal_note.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_meal_note_model.g.dart';

@JsonSerializable()
class OrderMealNoteModel extends OrderMealNote {
  static const String className = 'OrderMealNoteModel';

  const OrderMealNoteModel({
    required String name,
    required int mealId,
    required int orderId,
    required double? mealRate,
    required String? mealRateNotes,
    required String preparedAt,
  }) : super(
          name: name,
          mealId: mealId,
          orderId: orderId,
          mealRate: mealRate,
          mealRateNotes: mealRateNotes,
          preparedAt: preparedAt,
        );

  factory OrderMealNoteModel.fromJson(Map<String, dynamic> json) =>
      _$OrderMealNoteModelFromJson(json);
}
