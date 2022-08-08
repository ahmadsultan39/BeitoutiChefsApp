
import 'package:beitouti_chefs/features/subscriptions/domain/entities/add_subscription_meal.dart';
import 'package:beitouti_chefs/features/subscriptions/domain/entities/subscription.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'subscriptions_state.g.dart';

abstract class SubscriptionsState
    implements Built<SubscriptionsState, SubscriptionsStateBuilder> {

  List<Subscription> get subscriptions;

  BuiltList<AddSubscriptionMeal> get meals;

  bool get popScreen;

  bool get isLoading;

  bool get error;

  String get message;

  SubscriptionsState._();

  factory SubscriptionsState([Function(SubscriptionsStateBuilder b) updates]) =
  _$SubscriptionsState;

  factory SubscriptionsState.initial() {
    return SubscriptionsState(
          (b) => b
          ..subscriptions = []
            ..meals.replace([])
            ..popScreen = false
        ..isLoading = false
        ..error = false
        ..message = "",
    );
  }
}
