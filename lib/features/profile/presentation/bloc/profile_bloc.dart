import 'package:beitouti_chefs/core/network/params/paginate_list_params.dart';
import 'package:beitouti_chefs/core/usecase/usecase.dart';
import 'package:beitouti_chefs/features/add_meal/domain/use_cases/pick_image.dart';
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
  final PickImageUseCase _pickImageUseCase;
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

  void addPickImageEvent() {
    add(PickImage((b) => b));
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

  void addGetOrderMealsNotesEvent() {
    add(GetOrdersMealsNote());
  }

  void addGetProfileEvent() {
    add(GetProfile());
  }

  void addGetOrdersHistoryEvent() {
    add(GetOrdersHistory((b) => b..page = state.preparedOrder.currentPage));
  }

  void addLogoutEvent() {
    add(Logout());
  }

  void changePopStatus() {
    add(ChangePopStatus());
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
    this._pickImageUseCase,
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

        /// *** ChangePopStatus *** ///
        if (event is ChangePopStatus) {
          emit(state.rebuild((b) => b..pop = false));
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
                  ..message = failure.error
                  ..error = true,
              ),
            ),
            (r) => emit(
              state.rebuild(
                (b) => b
                  ..isLoading = false
                  ..isLoggedOut = true,
              ),
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

        /// *** EditDeliverMealTime *** ///
        if (event is EditDeliverMealTime) {
          emit(state.rebuild((b) => b..isLoading = true));

          final result = await _editDeliverTimeUseCase(
            ParamsEditDeliverTimeUseCase(
                startsAt: event.deliveryStartsAt, endsAt: event.deliveryEndsAt),
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
                  ..pop = true
                  ..message = 'تم تغيير التوقيت بنجاح',
              ),
            ),
          );
        }

        /// *** EditMaxMealsPerDay *** ///
        if (event is EditMaxMealsPerDay) {
          emit(state.rebuild((b) => b..isLoading = true));

          final result = await _editMaxMealsPerDayUseCase(
            ParamsEditMaxMealsPerDayUseCase(
              maxMealsPerDay: event.maxMealsPerDay,
            ),
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
                  ..pop = true
                  ..message = 'تم تغيير العدد بنجاح',
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
              (b) => b..isLoading = true,
            ),
          );

          final result = await _getOrderMealsNotesUseCase(NoParams());

          result.fold(
            (failure) => emit(
              state.rebuild(
                (b) => b
                  ..isLoading = false
                  ..error = true
                  ..message = failure.error,
              ),
            ),
            (orderMealsNotes) => emit(
              state.rebuild(
                (b) => b
                  ..isLoading = false
                  ..orderMealsNotes.addAll(orderMealsNotes),
              ),
            ),
          );
        }

        /// *** GetOrderHistory *** ///
        if (event is GetOrdersHistory) {
          if (!state.preparedOrder.isFinished) {
            if (event.page == 1) {
              emit(state.rebuild((b) => b..isLoading = true));
            } else {
              emit(state.rebuild((b) => b..preparedOrder.isLoading = true));
            }

            final result = await _getOrdersHistoryUseCase(
              PaginateListParams(event.page),
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
              (preparedOrder) => emit(
                state.rebuild(
                  (b) => b
                    ..isLoading = false
                    ..preparedOrder.items.addAll(preparedOrder.data)
                    ..preparedOrder.isLoading = false
                    ..preparedOrder.currentPage = event.page
                    ..preparedOrder.isFinished =
                        event.page == preparedOrder.pages,
                ),
              ),
            );
          }
        }

        /// *** GetChefBalance *** ///
        if (event is GetChefBalance) {
          emit(
            state.rebuild(
              (b) => b..isLoading = true,
            ),
          );

          final result = await _getChefBalanceUseCase(NoParams());

          result.fold(
            (failure) => emit(
              state.rebuild(
                (b) => b
                  ..isLoading = false
                  ..error = true
                  ..message = failure.error,
              ),
            ),
            (chefBalance) => emit(
              state.rebuild(
                (b) => b
                  ..isLoading = false
                  ..chefBalance = chefBalance,
              ),
            ),
          );
        }

        /// *** GetProfile *** ///
        if (event is GetProfile) {
          emit(
            state.rebuild(
              (b) => b..isLoading = true,
            ),
          );

          final result = await _getProfileUseCase(NoParams());

          result.fold(
            (failure) => emit(
              state.rebuild(
                (b) => b
                  ..isLoading = false
                  ..error = true
                  ..message = failure.error,
              ),
            ),
            (profile) => emit(
              state.rebuild(
                (b) => b
                  ..isLoading = false
                  ..profile = profile,
              ),
            ),
          );
        }

        /// *** PickImage *** ///
        if (event is PickImage) {
          final result = await _pickImageUseCase(NoParams());

          result.fold(
            (failure) {
              emit(
                state.rebuild(
                  (b) => b
                    ..error = true
                    ..message = failure.error,
                ),
              );
            },
            (image) {
              emit(
                state.rebuild(
                  (b) => b..pickedImage = image,
                ),
              );
              if (image != null) {
                addChangeProfilePictureEvent(image: image);
              }
            },
          );
        }
      },
    );
  }
}
