import 'package:beitouti_chefs/core/entities/category.dart';
import 'package:built_value/built_value.dart';
import 'package:image_picker/image_picker.dart';

part 'add_meal_state.g.dart';

abstract class AddMealState
    implements Built<AddMealState, AddMealStateBuilder> {
  //getter fields

  bool get isLoading;

  String? get imageUrl;

  XFile? get pickedImage;

  String? get name;

  String? get category;

  String? get ingredients;

  int? get preparingTime;

  int? get maxMeals;

  int? get price;

  int? get finalPrice;

  double? get discount;

  bool get isCategoriesLoading;
  List<Category> get categories;

  bool get error;

  String get message;

  AddMealState._();

  factory AddMealState([Function(AddMealStateBuilder b) updates]) =
      _$AddMealState;

  factory AddMealState.initial() {
    return AddMealState(
      (b) => b
        ..isLoading = false
        ..isCategoriesLoading = false
        ..categories = []
        ..error = false
        ..message = "",
    );
  }
}
