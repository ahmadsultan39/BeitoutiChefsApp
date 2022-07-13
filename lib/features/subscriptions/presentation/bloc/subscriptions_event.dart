
import 'package:beitouti_chefs/features/subscriptions/domain/use_cases/add_new_subscription.dart';
import 'package:beitouti_chefs/features/subscriptions/domain/use_cases/edit_subscription.dart';
import 'package:built_value/built_value.dart';
part 'subscriptions_event.g.dart';
abstract class SubscriptionsEvent {}


abstract class GetSubscriptionsEvent extends SubscriptionsEvent
    implements Built<GetSubscriptionsEvent, GetSubscriptionsEventBuilder> {

  GetSubscriptionsEvent._();

  factory GetSubscriptionsEvent([Function(GetSubscriptionsEventBuilder b) updates]) = _$GetSubscriptionsEvent;

  factory GetSubscriptionsEvent.initial() {
    return GetSubscriptionsEvent((b) => b);
  }
}

abstract class GetChefMealsEvent extends SubscriptionsEvent
    implements Built<GetChefMealsEvent, GetChefMealsEventBuilder> {

  GetChefMealsEvent._();

  factory GetChefMealsEvent([Function(GetChefMealsEventBuilder b) updates]) = _$GetChefMealsEvent;

  factory GetChefMealsEvent.initial() {
    return GetChefMealsEvent((b) => b);
  }
}

abstract class DeleteSubscriptionEvent extends SubscriptionsEvent
    implements Built<DeleteSubscriptionEvent, DeleteSubscriptionEventBuilder> {
  int get id;
  DeleteSubscriptionEvent._();

  factory DeleteSubscriptionEvent([Function(DeleteSubscriptionEventBuilder b) updates]) = _$DeleteSubscriptionEvent;

  factory DeleteSubscriptionEvent.initial() {
    return DeleteSubscriptionEvent((b) => b);
  }
}

abstract class EditSubscriptionAvailabilityEvent extends SubscriptionsEvent
    implements Built<EditSubscriptionAvailabilityEvent, EditSubscriptionAvailabilityEventBuilder> {
  int get id;
  EditSubscriptionAvailabilityEvent._();

  factory EditSubscriptionAvailabilityEvent([Function(EditSubscriptionAvailabilityEventBuilder b) updates]) = _$EditSubscriptionAvailabilityEvent;

  factory EditSubscriptionAvailabilityEvent.initial() {
    return EditSubscriptionAvailabilityEvent((b) => b);
  }
}

abstract class AddSubscriptionEvent extends SubscriptionsEvent
    implements Built<AddSubscriptionEvent, AddSubscriptionEventBuilder> {
  ParamsAddNewSubscriptionUseCase get params;
  AddSubscriptionEvent._();

  factory AddSubscriptionEvent([Function(AddSubscriptionEventBuilder b) updates]) = _$AddSubscriptionEvent;

  factory AddSubscriptionEvent.initial() {
    return AddSubscriptionEvent((b) => b);
  }
}

abstract class EditSubscriptionEvent extends SubscriptionsEvent
    implements Built<EditSubscriptionEvent, EditSubscriptionEventBuilder> {
  ParamsEditSubscriptionUseCase get params;
  EditSubscriptionEvent._();

  factory EditSubscriptionEvent([Function(EditSubscriptionEventBuilder b) updates]) = _$EditSubscriptionEvent;

  factory EditSubscriptionEvent.initial() {
    return EditSubscriptionEvent((b) => b);
  }
}


abstract class ClearError extends SubscriptionsEvent
    implements Built<ClearError, ClearErrorBuilder> {

  ClearError._();

  factory ClearError([Function(ClearErrorBuilder b) updates]) = _$ClearError;

  factory ClearError.initial() {
    return ClearError((b) => b);
  }
}