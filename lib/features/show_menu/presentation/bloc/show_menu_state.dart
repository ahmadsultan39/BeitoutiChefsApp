import 'package:beitouti_chefs/core/entities/category.dart';
import 'package:beitouti_chefs/core/entities/meal.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import '../../domain/entities/meals_info.dart';

part 'show_menu_state.g.dart';

abstract class ShowMenuState
    implements Built<ShowMenuState, ShowMenuStateBuilder> {
  //getter fields

  List<Category> get categories;

  Map<int,BuiltList<Meal>> get meals;

  MealsInfo get mealsInfo;

  bool get isLoading;

  bool get error;

  String get message;

  ShowMenuState._();

  factory ShowMenuState([Function(ShowMenuStateBuilder b) updates]) =
      _$ShowMenuState;

  factory ShowMenuState.initial() {
    return ShowMenuState(
      (b) => b
        ..isLoading = false
        ..categories = []
        ..meals = {}
        ..mealsInfo = MealsInfo(0, 0)
        ..error = false
        ..message = "",
    );
  }
}
