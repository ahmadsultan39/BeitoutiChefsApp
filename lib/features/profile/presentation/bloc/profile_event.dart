import 'package:built_value/built_value.dart';

part 'profile_event.g.dart';

abstract class ProfileEvent {}

abstract class ClearMessage extends ProfileEvent
    implements Built<ClearMessage, ClearMessageBuilder> {
  //getter fields

  ClearMessage._();

  factory ClearMessage([Function(ClearMessageBuilder b) updates]) =
  _$ClearMessage;

  factory ClearMessage.initial() {
    return ClearMessage((b) => b);
  }
}
