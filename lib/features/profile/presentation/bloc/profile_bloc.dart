import 'package:beitouti_chefs/core/usecase/usecase.dart';
import 'package:beitouti_chefs/features/profile/domain/use_cases/change_profile_picture_use_case.dart';
import 'package:beitouti_chefs/features/profile/domain/use_cases/edit_deliver_meal_time_use_case.dart';
import 'package:beitouti_chefs/features/profile/domain/use_cases/edit_max_meals_per_day_use_case.dart';
import 'package:beitouti_chefs/features/profile/domain/use_cases/get_chef_balance_use_case.dart';
import 'package:beitouti_chefs/features/profile/domain/use_cases/get_order_meals_notes.dart';
import 'package:beitouti_chefs/features/profile/domain/use_cases/get_orders_history_use_case.dart';
import 'package:beitouti_chefs/features/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:beitouti_chefs/features/profile/domain/use_cases/logout_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import 'profile.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ChangeProfilePictureUseCase _changeProfilePictureUseCase;
  final GetOrderMealsNotesUseCase _getOrderMealsNotesUseCase;
  final EditMaxMealsPerDayUseCase _editMaxMealsPerDayUseCase;
  final GetOrdersHistoryUseCase _getOrdersHistoryUseCase;
  final EditDeliverTimeUseCase _editDeliverTimeUseCase;
  final GetChefBalanceUseCase _getChefBalanceUseCase;
  final GetProfileUseCase _getProfileUseCase;
  final LogoutUseCase _logoutUseCase;

  void addChangeProfilePictureEvent({
    required XFile image,
  }) {
    add(ChangeProfilePicture((b) => b..image = image));
  }

  void addEditDeliverMealTimeEvent({
    required String startsAt,
    required String endsAt,
  }) {
    add(EditDeliverMealTime(
      (b) => b
        ..deliveryStartsAt = startsAt
        ..deliveryEndsAt = endsAt,
    ));
  }

  void addEditMaxMealsPerDayEvent({
    required int maxMealsPerDay,
  }) {
    add(EditMaxMealsPerDay(
      (b) => b..maxMealsPerDay = maxMealsPerDay,
    ));
  }

  void addGetChefBalanceEvent() {
    add(GetChefBalance());
  }

  void addGetProfileEvent() {
    add(GetProfile());
  }

  void addGetOrdersHistoryEvent() {
    add(GetOrdersHistory());
  }

  void clearMessage() {
    add(ClearMessage());
  }

  @factoryMethod
  ProfileBloc(
    this._changeProfilePictureUseCase,
    this._logoutUseCase,
    this._getOrderMealsNotesUseCase,
    this._getOrdersHistoryUseCase,
    this._editDeliverTimeUseCase,
    this._getChefBalanceUseCase,
    this._getProfileUseCase,
    this._editMaxMealsPerDayUseCase,
  ) : super(ProfileState.initial()) {
    on<ProfileEvent>(
      (event, emit) async {
        /// *** ClearMessage *** ///
        if (event is ClearMessage) {
          emit(
            state.rebuild(
              (b) => b
                ..error = false
                ..message = '',
            ),
          );
        }

        /// *** ChangeProfilePicture *** ///
        if (event is ChangeProfilePicture) {
          emit(state.rebuild((b) => b..isLoading = true));

          final result = await _changeProfilePictureUseCase(
            ParamsChangeProfilePictureUseCase(image: event.image),
          );

          result.fold(
            (failure) => emit(
              state.rebuild(
                (b) => b
                  ..isLoading = false
                  ..error = true
                  ..message = failure.error,
              ),
            ),
            (success) => emit(
              state.rebuild(
                (b) => b
                  ..isLoading = false
                  ..message = 'تم تغيير الصورة الشخصية بنجاح',
              ),
            ),
          );
        }

        /// *** Logout *** ///
        if (event is Logout) {
          emit(state.rebuild((b) => b..isLoading = true));

          final result = await _logoutUseCase(NoParams());

          result.fold(
            (failure) => emit(
              state.rebuild(
                (b) => b
                  ..isLoading = false
                  ..error = true
                  ..message = failure.error,
              ),
            ),
            (success) => emit(
              state.rebuild(
                (b) => b
                  ..isLoading = false
                  ..isLoggedOut = true,
              ),
            ),
          );
        }

        /// *** GetOrderMealsNotes *** ///
        if (event is GetOrdersMealsNote) {
          emit(
            state.rebuild(
              (b) => b..profilePagesState!.mealsNotesPageState.isLoading = true,
            ),
          );

          final result = await _getOrderMealsNotesUseCase(NoParams());

          result.fold(
            (failure) => emit(
              state.rebuild(
                (b) => b
                  ..profilePagesState!.mealsNotesPageState.isLoading = false
                  ..profilePagesState!.mealsNotesPageState.error = true
                  ..profilePagesState!.mealsNotesPageState.message =
                      failure.error,
              ),
            ),
            (orderMealsNotes) => emit(
              state.rebuild(
                (b) => b
                  ..profilePagesState!.mealsNotesPageState.isLoading = false
                  ..orderMealsNotes.addAll(orderMealsNotes),
              ),
            ),
          );
        }

        /// *** GetOrderHistory *** ///
        if (event is GetOrdersHistory) {
          emit(
            state.rebuild(
              (b) =>
                  b..profilePagesState!.orderHistoryPageState.isLoading = true,
            ),
          );

          final result = await _getOrdersHistoryUseCase(NoParams());

          result.fold(
            (failure) => emit(
              state.rebuild(
                (b) => b
                  ..profilePagesState!.orderHistoryPageState.isLoading = false
                  ..profilePagesState!.orderHistoryPageState.error = true
                  ..profilePagesState!.orderHistoryPageState.message =
                      failure.error,
              ),
            ),
            (preparedOrder) => emit(
              state.rebuild(
                (b) => b
                  ..profilePagesState!.orderHistoryPageState.isLoading = false
                  ..preparedOrder.addAll(preparedOrder),
              ),
            ),
          );
        }

        /// *** GetChefBalance *** ///
        if (event is GetChefBalance) {
          emit(
            state.rebuild(
                  (b) =>
              b..profilePagesState,
            ),
          );

          final result = await _getOrdersHistoryUseCase(NoParams());

          result.fold(
                (failure) => emit(
              state.rebuild(
                    (b) => b
                  ..profilePagesState!.orderHistoryPageState.isLoading = false
                  ..profilePagesState!.orderHistoryPageState.error = true
                  ..profilePagesState!.orderHistoryPageState.message =
                      failure.error,
              ),
            ),
                (preparedOrder) => emit(
              state.rebuild(
                    (b) => b
                  ..profilePagesState!.orderHistoryPageState.isLoading = false
                  ..preparedOrder.addAll(preparedOrder),
              ),
            ),
          );
        }
      },
    );
  }
}
