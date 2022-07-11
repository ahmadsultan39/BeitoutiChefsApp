import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'profile.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  void clearMessage() {
    add(ClearMessage());
  }

  @factoryMethod
  ProfileBloc() : super(ProfileState.initial()) {
    on<ProfileEvent>(
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
