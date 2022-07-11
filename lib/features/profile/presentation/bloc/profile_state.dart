import 'package:built_value/built_value.dart';

part 'profile_state.g.dart';

abstract class ProfileState
    implements Built<ProfileState, ProfileStateBuilder> {
  bool get isLoading;

  String get message;

  bool get error;

  ProfileState._();

  factory ProfileState([Function(ProfileStateBuilder b) updates]) =
  _$ProfileState;

  factory ProfileState.initial() {
    return ProfileState(
          (b) => b
        ..isLoading = false
        ..message = ""
        ..error = false,
    );
  }
}
