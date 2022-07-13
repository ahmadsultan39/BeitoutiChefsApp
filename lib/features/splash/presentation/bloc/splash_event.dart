import 'package:built_value/built_value.dart';

part 'splash_event.g.dart';

abstract class SplashEvent {}

abstract class CheckAuth extends SplashEvent
    implements Built<CheckAuth, CheckAuthBuilder> {
  //getter fields

  CheckAuth._();

  factory CheckAuth([Function(CheckAuthBuilder b) updates]) = _$CheckAuth;

  factory CheckAuth.initial() {
    return CheckAuth((b) => b);
  }
}

abstract class ClearMessage extends SplashEvent
    implements Built<ClearMessage, ClearMessageBuilder> {
  //getter fields

  ClearMessage._();

  factory ClearMessage([Function(ClearMessageBuilder b) updates]) =
  _$ClearMessage;

  factory ClearMessage.initial() {
    return ClearMessage((b) => b);
  }
}
