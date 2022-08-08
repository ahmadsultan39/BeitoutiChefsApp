import 'package:built_value/built_value.dart';

part 'show_menu_event.g.dart';

abstract class ShowMenuEvent {}

abstract class GetCategoriesEvent extends ShowMenuEvent
    implements Built<GetCategoriesEvent, GetCategoriesEventBuilder> {
  GetCategoriesEvent._();

  factory GetCategoriesEvent([Function(GetCategoriesEventBuilder b) updates]) =
  _$GetCategoriesEvent;

  factory GetCategoriesEvent.initial() {
    return GetCategoriesEvent((b) => b);
  }
}

abstract class GetActiveMealsCountEvent extends ShowMenuEvent
    implements Built<GetActiveMealsCountEvent, GetActiveMealsCountEventBuilder> {
  GetActiveMealsCountEvent._();

  factory GetActiveMealsCountEvent([Function(GetActiveMealsCountEventBuilder b) updates]) =
  _$GetActiveMealsCountEvent;

  factory GetActiveMealsCountEvent.initial() {
    return GetActiveMealsCountEvent((b) => b);
  }
}


abstract class GetCategoryMealsEvent extends ShowMenuEvent
    implements Built<GetCategoryMealsEvent, GetCategoryMealsEventBuilder> {
  int get categoryId;

  GetCategoryMealsEvent._();

  factory GetCategoryMealsEvent([Function(GetCategoryMealsEventBuilder b) updates]) =
  _$GetCategoryMealsEvent;

  factory GetCategoryMealsEvent.initial() {
    return GetCategoryMealsEvent((b) => b);
  }
}

abstract class IncreaseMaxMealNumberEvent extends ShowMenuEvent
    implements Built<IncreaseMaxMealNumberEvent, IncreaseMaxMealNumberEventBuilder> {
  int get mealId;
  int get categoryId;

  IncreaseMaxMealNumberEvent._();

  factory IncreaseMaxMealNumberEvent([Function(IncreaseMaxMealNumberEventBuilder b) updates]) =
  _$IncreaseMaxMealNumberEvent;

  factory IncreaseMaxMealNumberEvent.initial() {
    return IncreaseMaxMealNumberEvent((b) => b);
  }
}

abstract class DecreaseMaxMealNumberEvent extends ShowMenuEvent
    implements Built<DecreaseMaxMealNumberEvent, DecreaseMaxMealNumberEventBuilder> {
  int get mealId;
  int get categoryId;

  DecreaseMaxMealNumberEvent._();

  factory DecreaseMaxMealNumberEvent([Function(DecreaseMaxMealNumberEventBuilder b) updates]) =
  _$DecreaseMaxMealNumberEvent;

  factory DecreaseMaxMealNumberEvent.initial() {
    return DecreaseMaxMealNumberEvent((b) => b);
  }
}

abstract class ChangeMealAvailabilityEvent extends ShowMenuEvent
    implements Built<ChangeMealAvailabilityEvent, ChangeMealAvailabilityEventBuilder> {
  int get mealId;
  int get categoryId;

  ChangeMealAvailabilityEvent._();

  factory ChangeMealAvailabilityEvent([Function(ChangeMealAvailabilityEventBuilder b) updates]) =
  _$ChangeMealAvailabilityEvent;

  factory ChangeMealAvailabilityEvent.initial() {
    return ChangeMealAvailabilityEvent((b) => b);
  }
}

abstract class DeleteMealEvent extends ShowMenuEvent
    implements Built<DeleteMealEvent, DeleteMealEventBuilder> {
  int get mealId;
  int get categoryId;

  DeleteMealEvent._();

  factory DeleteMealEvent([Function(DeleteMealEventBuilder b) updates]) =
  _$DeleteMealEvent;

  factory DeleteMealEvent.initial() {
    return DeleteMealEvent((b) => b);
  }
}

abstract class ClearMessage extends ShowMenuEvent
    implements Built<ClearMessage, ClearMessageBuilder> {
  ClearMessage._();

  factory ClearMessage([Function(ClearMessageBuilder b) updates]) =
  _$ClearMessage;

  factory ClearMessage.initial() {
    return ClearMessage((b) => b);
  }
}