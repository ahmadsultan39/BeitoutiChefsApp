import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'home.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  void clearMessage() {
    add(ClearMessage());
  }

  @factoryMethod
  HomeBloc() : super(HomeState.initial()) {
    on<HomeEvent>(
      (event, emit) {
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
      },
    );
  }
}
