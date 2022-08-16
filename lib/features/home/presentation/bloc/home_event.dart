import 'package:built_value/built_value.dart';

part 'home_event.g.dart';

abstract class HomeEvent {}

abstract class ClearMessage extends HomeEvent
    implements Built<ClearMessage, ClearMessageBuilder> {
  //getter fields

  ClearMessage._();

  factory ClearMessage([Function(ClearMessageBuilder b) updates]) =
      _$ClearMessage;

  factory ClearMessage.initial() {
    return ClearMessage((b) => b);
  }
}

abstract class ChangeAvailabilityEvent extends HomeEvent
    implements Built<ChangeAvailabilityEvent, ChangeAvailabilityEventBuilder> {
//getter fields

  ChangeAvailabilityEvent._();

  factory ChangeAvailabilityEvent(
      [Function(ChangeAvailabilityEventBuilder b) updates]) =
  _$ChangeAvailabilityEvent;

  factory ChangeAvailabilityEvent.initial() {
    return ChangeAvailabilityEvent((b) => b);
  }
}


abstract class GetAvailabilityStatus extends HomeEvent
    implements Built<GetAvailabilityStatus, GetAvailabilityStatusBuilder> {
//getter fields

  GetAvailabilityStatus._();

  factory GetAvailabilityStatus(
      [Function(GetAvailabilityStatusBuilder b) updates]) =
  _$GetAvailabilityStatus;

  factory GetAvailabilityStatus.initial() {
    return GetAvailabilityStatus((b) => b);
  }
}
