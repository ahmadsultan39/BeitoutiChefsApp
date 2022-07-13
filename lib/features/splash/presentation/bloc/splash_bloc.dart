import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/use_cases/check_auth_use_case.dart';
import 'splash.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final CheckAuthUseCase _checkAuthUseCase;

  void addCheckAuthEvent() {
    add(CheckAuth());
  }

  void clearMessage() {
    add(ClearMessage());
  }

  @factoryMethod
  SplashBloc(
    this._checkAuthUseCase,
  ) : super(SplashState.initial()) {
    on<SplashEvent>((event, emit) async {
      /*** ClearMessage ***/
      if (event is ClearMessage) {
        emit(
          state.rebuild(
            (b) => b
              ..error = false
              ..message = '',
          ),
        );
      }

      /*** CheckAuth ***/
      if (event is CheckAuth) {
        // emit(state.rebuild((b) => b..isLoading = true));

        final result = await _checkAuthUseCase(NoParams());

        result.fold(
          (failure) => emit(
            state.rebuild(
              (b) => b
                ..error = true
                ..message = failure.error
                ..isAuth = false,
            ),
          ),
          (isAuth) => emit(
            state.rebuild(
              (b) => b..isAuth = isAuth,
            ),
          ),
        );
      }
    });
  }
}
