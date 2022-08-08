import 'package:beitouti_chefs/core/usecase/usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_cases/change_availability_use_case.dart';
import 'home.dart';

@lazySingleton
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ChangeAvailabilityUseCase _changeAvailabilityUseCase;

  void clearMessage() {
    add(ClearMessage());
  }

  void addChangeAvailabilityEvent() {
    add(ChangeAvailabilityEvent());
  }

  @factoryMethod
  HomeBloc(this._changeAvailabilityUseCase) : super(HomeState.initial()) {
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

        /// *** ChangeAvailabilityEvent *** ///
        if (event is ChangeAvailabilityEvent) {
          emit(state.rebuild((b) => b..isLoading = true));

          final result = await _changeAvailabilityUseCase(NoParams());

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
