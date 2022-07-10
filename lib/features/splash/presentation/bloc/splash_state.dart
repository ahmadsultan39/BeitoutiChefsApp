import 'package:built_value/built_value.dart';

part 'splash_state.g.dart';

abstract class SplashState implements Built<SplashState, SplashStateBuilder> {
  bool get isLoading;

  String get message;

  bool get error;

  bool? get isAuth;

  SplashState._();

  factory SplashState([Function(SplashStateBuilder b) updates]) = _$SplashState;

  factory SplashState.initial() {
    return SplashState(
          (b) => b
        ..isLoading = false
        ..message = ""
        ..isAuth = null
        ..error = false,
    );
  }
}
