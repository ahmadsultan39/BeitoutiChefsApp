import 'package:beitouti_chefs/core/usecase/usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_cases/change_availability_use_case.dart';
import '../../domain/use_cases/get_availability_status_use_case.dart';
import 'home.dart';

@lazySingleton
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ChangeAvailabilityUseCase _changeAvailabilityUseCase;
  final GetAvailabilityStatusUseCase _getAvailabilityStatusUseCase;

  void clearMessage() {
    add(ClearMessage());
  }

  void addChangeAvailabilityEvent() {
    add(ChangeAvailabilityEvent());
  }

  void addGetAvailabilityStatusEvent() {
    add(GetAvailabilityStatus());
  }

  @factoryMethod
  HomeBloc(
    this._changeAvailabilityUseCase,
    this._getAvailabilityStatusUseCase,
  ) : super(HomeState.initial()) {
    on<HomeEvent>(
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

        /// *** GetAvailabilityStatus *** ///
        if (event is GetAvailabilityStatus) {
          final result = await _getAvailabilityStatusUseCase(NoParams());

          result.fold(
            (failure) => emit(state.rebuild((b) => b..active = false)),
            (status) => emit(state.rebuild((b) => b..active = status)),
          );
        }

        /// *** ChangeAvailabilityEvent *** ///
        if (event is ChangeAvailabilityEvent) {
          emit(state.rebuild((b) => b..isLoading = true));

          final result = await _changeAvailabilityUseCase(
            ParamsChangeAvailabilityStatus(
              state.active,
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
                  ..active = !state.active
                  ..message = 'تم تغيير الحالة بنجاح',
              ),
            ),
          );
        }
      },
    );
  }
}
