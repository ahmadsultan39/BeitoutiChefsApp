import 'package:beitouti_chefs/features/subscriptions/domain/use_cases/delete_subscription.dart';
import 'package:beitouti_chefs/features/subscriptions/domain/use_cases/edit_subscription.dart';
import 'package:beitouti_chefs/features/subscriptions/domain/use_cases/edit_subscription_availability.dart';
import 'package:beitouti_chefs/features/subscriptions/domain/use_cases/get_chef_meals.dart';
import 'package:beitouti_chefs/features/subscriptions/domain/use_cases/get_subscriptoins.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/use_cases/add_new_subscription.dart';
import 'subscriptions.dart';
import 'package:bloc/bloc.dart';

@injectable
class SubscriptionsBloc extends Bloc<SubscriptionsEvent, SubscriptionsState> {
  final GetSubscriptionsUseCase getSubscriptionsUseCase;
  final DeleteSubscriptionUseCase deleteSubscriptionUseCase;
  final EditSubscriptionAvailabilityUseCase editSubscriptionAvailabilityUseCase;
  final GetChefMealsUseCase getChefMealsUseCase;
  final AddNewSubscriptionUseCase addNewSubscriptionUseCase;
  final EditSubscriptionUseCase editSubscriptionUseCase;

  void addGetSubscriptionsEvent() {
    add(GetSubscriptionsEvent((b) => b));
  }

  void addGetChefMealsEvent() {
    add(GetChefMealsEvent((b) => b));
  }

  void addAddNewSubscriptionEvent(ParamsAddNewSubscriptionUseCase params) {
    add(AddSubscriptionEvent((b) => b..params = params));
  }

  void addEditSubscriptionEvent(ParamsEditSubscriptionUseCase params) {
    add(EditSubscriptionEvent((b) => b..params = params));
  }

  void addDeleteSubscriptionsEvent(int id) {
    add(DeleteSubscriptionEvent((b) => b..id = id));
  }

  void addEditSubscriptionAvailabilityEvent(int id) {
    add(EditSubscriptionAvailabilityEvent((b) => b..id = id));
  }

  void clearMessage() {
    add(ClearMessage());
  }

  @factoryMethod
  SubscriptionsBloc(this.getSubscriptionsUseCase, this.deleteSubscriptionUseCase, this.editSubscriptionAvailabilityUseCase, this.getChefMealsUseCase, this.addNewSubscriptionUseCase, this.editSubscriptionUseCase)
      : super(SubscriptionsState.initial()) {
    on<SubscriptionsEvent>((event, emit) async {

      /***** Get Subscriptions *****/
      if (event is GetSubscriptionsEvent) {
        emit(state.rebuild((b) => b..isLoading = true));
        final result = await getSubscriptionsUseCase(NoParams());

        result.fold((failure) {
          emit(state.rebuild(
                (b) => b
              ..isLoading = false
              ..error = true
              ..message = failure.error,
          ));
        }, (subscriptions) {
          emit(
            state.rebuild(
                  (b) => b
                ..isLoading = false
                ..subscriptions = subscriptions,
            ),
          );
        });
      }

      /***** Get Chef Meals *****/
      if (event is GetChefMealsEvent) {
        emit(state.rebuild((b) => b..isLoading = true));
        final result = await getChefMealsUseCase(NoParams());

        result.fold((failure) {
          emit(state.rebuild(
                (b) => b
              ..isLoading = false
              ..error = true
              ..message = failure.error,
          ));
        }, (meals) {
          emit(
            state.rebuild(
                  (b) => b
                ..isLoading = false
                ..meals.replace(meals)
            ),
          );
        });
      }


      /***** Delete Subscription *****/
      if (event is DeleteSubscriptionEvent) {
        emit(state.rebuild((b) => b..isLoading = true));
        final result = await deleteSubscriptionUseCase(ParamsDeleteSubscriptionUseCase(event.id));

        result.fold((failure) {
          emit(state.rebuild(
                (b) => b
              ..isLoading = false
              ..error = true
              ..message = failure.error,
          ));
        }, (_) {
          emit(
            state.rebuild(
                  (b) => b
                ..isLoading = false
                ..subscriptions!.removeWhere((element) => element.id == event.id),
            ),
          );
        });
      }



      /***** Edit Subscription Availability *****/
      if (event is EditSubscriptionAvailabilityEvent) {
        emit(state.rebuild((b) => b..isLoading = true));
        final result = await editSubscriptionAvailabilityUseCase(ParamsEditSubscriptionAvailabilityUseCase(event.id));

        result.fold((failure) {
          emit(state.rebuild(
                (b) => b
              ..isLoading = false
              ..error = true
              ..message = failure.error,
          ));
        }, (message) {
          // emit(
          //   state.rebuild(
          //         (b) => b
          //       ..isLoading = false
          //           ..message = message
          //       ..subscriptions!.firstWhere((element) => element.id == event.id).editAvailability(),
          //   ),
          // );
          addGetSubscriptionsEvent();
        });
      }

      /***** Add Subscription *****/
      if (event is AddSubscriptionEvent) {
        emit(state.rebuild((b) => b..isLoading = true));
        final result = await addNewSubscriptionUseCase(event.params);

        result.fold((failure) {
          emit(state.rebuild(
                (b) => b
              ..isLoading = false
              ..error = true
              ..message = failure.error,
          ));
        }, (_) {
          emit(
            state.rebuild(
                  (b) => b
                ..isLoading = false,
            ),
          );
        });
      }

      /***** Edit Subscription *****/
      if (event is EditSubscriptionEvent) {
        emit(state.rebuild((b) => b..isLoading = true));
        final result = await editSubscriptionUseCase(event.params);

        result.fold((failure) {
          emit(state.rebuild(
                (b) => b
              ..isLoading = false
              ..error = true
              ..message = failure.error,
          ));
        }, (_) {
          emit(
            state.rebuild(
                  (b) => b
                ..isLoading = false,
            ),
          );
        });
      }




      /// *** ClearMessage *** //
      if (event is ClearMessage) {
        emit(
          state.rebuild(
                (b) => b
              ..error = false
              ..message = '',
          ),
        );
      }
    });
  }
}
