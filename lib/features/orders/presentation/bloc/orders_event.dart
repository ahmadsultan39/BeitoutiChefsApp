import 'package:built_value/built_value.dart';

part 'orders_event.g.dart';

abstract class OrdersEvent {}

abstract class GetTomorrowOrdersTimes extends OrdersEvent
    implements Built<GetTomorrowOrdersTimes, GetTomorrowOrdersTimesBuilder> {
  GetTomorrowOrdersTimes._();

  factory GetTomorrowOrdersTimes(
          [Function(GetTomorrowOrdersTimesBuilder b) updates]) =
      _$GetTomorrowOrdersTimes;

  factory GetTomorrowOrdersTimes.initial() {
    return GetTomorrowOrdersTimes((b) => b);
  }
}

abstract class GetTodayOrdersTimes extends OrdersEvent
    implements Built<GetTodayOrdersTimes, GetTodayOrdersTimesBuilder> {
  GetTodayOrdersTimes._();

  factory GetTodayOrdersTimes(
      [Function(GetTodayOrdersTimesBuilder b) updates]) = _$GetTodayOrdersTimes;

  factory GetTodayOrdersTimes.initial() {
    return GetTodayOrdersTimes((b) => b);
  }
}

abstract class GetTodayTimeOrdersEvent extends OrdersEvent
    implements Built<GetTodayTimeOrdersEvent, GetTodayTimeOrdersEventBuilder> {
  String get time;

  GetTodayTimeOrdersEvent._();

  factory GetTodayTimeOrdersEvent(
          [Function(GetTodayTimeOrdersEventBuilder b) updates]) =
      _$GetTodayTimeOrdersEvent;

  factory GetTodayTimeOrdersEvent.initial() {
    return GetTodayTimeOrdersEvent((b) => b);
  }
}

abstract class GetTomorrowTimeOrdersEvent extends OrdersEvent
    implements
        Built<GetTomorrowTimeOrdersEvent, GetTomorrowTimeOrdersEventBuilder> {
  String get time;

  GetTomorrowTimeOrdersEvent._();

  factory GetTomorrowTimeOrdersEvent(
          [Function(GetTomorrowTimeOrdersEventBuilder b) updates]) =
      _$GetTomorrowTimeOrdersEvent;

  factory GetTomorrowTimeOrdersEvent.initial() {
    return GetTomorrowTimeOrdersEvent((b) => b);
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
