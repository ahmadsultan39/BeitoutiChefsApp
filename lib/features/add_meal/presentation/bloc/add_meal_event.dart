import 'package:beitouti_chefs/core/entities/category.dart';
import 'package:beitouti_chefs/features/add_meal/domain/use_cases/add_meal.dart';
import 'package:beitouti_chefs/features/add_meal/domain/use_cases/edit_meal.dart';
import 'package:built_value/built_value.dart';
import 'package:image_picker/image_picker.dart';

part 'add_meal_event.g.dart';

abstract class AddMealEvent {}

abstract class GetCategoriesEvent extends AddMealEvent
    implements Built<GetCategoriesEvent, GetCategoriesEventBuilder> {
  GetCategoriesEvent._();

  factory GetCategoriesEvent([Function(GetCategoriesEventBuilder b) updates]) =
  _$GetCategoriesEvent;

  factory GetCategoriesEvent.initial() {
    return GetCategoriesEvent((b) => b);
  }
}

abstract class GetFinalPriceEvent extends AddMealEvent
    implements Built<GetFinalPriceEvent, GetFinalPriceEventBuilder> {
  int get price;
  GetFinalPriceEvent._();

  factory GetFinalPriceEvent([Function(GetFinalPriceEventBuilder b) updates]) =
  _$GetFinalPriceEvent;

  factory GetFinalPriceEvent.initial() {
    return GetFinalPriceEvent((b) => b);
  }
}

abstract class AddCategoryEvent extends AddMealEvent
    implements Built<AddCategoryEvent, AddCategoryEventBuilder> {
  String get name;
  AddCategoryEvent._();

  factory AddCategoryEvent([Function(AddCategoryEventBuilder b) updates]) =
  _$AddCategoryEvent;

  factory AddCategoryEvent.initial() {
    return AddCategoryEvent((b) => b);
  }
}

abstract class AddNewMealEvent extends AddMealEvent
    implements Built<AddNewMealEvent, AddNewMealEventBuilder> {
  AddMealUseCaseParams get mealData;

  AddNewMealEvent._();

  factory AddNewMealEvent([Function(AddNewMealEventBuilder b) updates]) =
  _$AddNewMealEvent;

  factory AddNewMealEvent.initial() {
    return AddNewMealEvent((b) => b);
  }
}

abstract class EditMealEvent extends AddMealEvent
    implements Built<EditMealEvent, EditMealEventBuilder> {
  EditMealUseCaseParams get mealData;

  EditMealEvent._();

  factory EditMealEvent([Function(EditMealEventBuilder b) updates]) =
  _$EditMealEvent;

  factory EditMealEvent.initial() {
    return EditMealEvent((b) => b);
  }
}

abstract class PickImage extends AddMealEvent
    implements Built<PickImage, PickImageBuilder> {
  PickImage._();

  factory PickImage([Function(PickImageBuilder b) updates]) = _$PickImage;
}

abstract class ClearError extends AddMealEvent
    implements Built<ClearError, ClearErrorBuilder> {

  ClearError._();

  factory ClearError([Function(ClearErrorBuilder b) updates]) = _$ClearError;

  factory ClearError.initial() {
    return ClearError((b) => b);
  }
}
