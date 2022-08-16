import 'package:built_value/built_value.dart';

part 'home_state.g.dart';

abstract class HomeState implements Built<HomeState, HomeStateBuilder> {
  bool get isLoading;

  String get message;

  bool get error;

  bool get active;

  HomeState._();

  factory HomeState([Function(HomeStateBuilder b) updates]) = _$HomeState;

  factory HomeState.initial() {
    return HomeState(
      (b) => b
        ..active = false
        ..isLoading = false
        ..error = false
        ..message = "",
    );
  }
}
