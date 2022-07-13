
import 'package:built_value/built_value.dart';

part 'orders_event.g.dart';

abstract class OrdersEvent {}

abstract class GetOrdersTimesEvent extends OrdersEvent
    implements Built<GetOrdersTimesEvent, GetOrdersTimesEventBuilder> {

  GetOrdersTimesEvent._();

  factory GetOrdersTimesEvent([Function(GetOrdersTimesEventBuilder b) updates]) =
  _$GetOrdersTimesEvent;

  factory GetOrdersTimesEvent.initial() {
    return GetOrdersTimesEvent((b) => b);
  }
}

abstract class GetTimeOrdersEvent extends OrdersEvent
    implements Built<GetTimeOrdersEvent, GetTimeOrdersEventBuilder> {
  String get time;

  GetTimeOrdersEvent._();

  factory GetTimeOrdersEvent([Function(GetTimeOrdersEventBuilder b) updates]) =
  _$GetTimeOrdersEvent;

  factory GetTimeOrdersEvent.initial() {
    return GetTimeOrdersEvent((b) => b);
  }
}

abstract class ChangeStatusEvent extends OrdersEvent
    implements Built<ChangeStatusEvent, ChangeStatusEventBuilder> {
  int get orderId;
  String get time;

  ChangeStatusEvent._();

  factory ChangeStatusEvent([Function(ChangeStatusEventBuilder b) updates]) =
  _$ChangeStatusEvent;

  factory ChangeStatusEvent.initial() {
    return ChangeStatusEvent((b) => b);
  }
}

abstract class ClearMessage extends OrdersEvent
    implements Built<ClearMessage, ClearMessageBuilder> {

  ClearMessage._();

  factory ClearMessage([Function(ClearMessageBuilder b) updates]) =
  _$ClearMessage;

  factory ClearMessage.initial() {
    return ClearMessage((b) => b);
  }
}