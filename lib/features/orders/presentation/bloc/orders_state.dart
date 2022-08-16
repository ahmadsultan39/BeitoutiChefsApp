import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import '../../domain/entities/orders_times.dart';
import '../../domain/entities/time_order.dart';

part 'orders_state.g.dart';

abstract class OrdersState implements Built<OrdersState, OrdersStateBuilder> {
  bool get isLoading;

  String get message;

  bool get error;

  BuiltList<OrdersTimes> get todayTimes;

  BuiltList<OrdersTimes> get tomorrowTimes;

  BuiltList<TimeOrder> get todayOrders;

  BuiltList<TimeOrder> get tomorrowOrders;

  bool get isTodayOrdersTimesLoading;

  bool get isTomorrowOrdersTimesLoading;

  bool get isTodayTimeOrdersLoading;

  bool get isTomorrowTimeOrdersLoading;

  OrdersState._();

  factory OrdersState([Function(OrdersStateBuilder b) updates]) = _$OrdersState;

  factory OrdersState.initial() {
    return OrdersState(
      (b) => b
        ..isLoading = false
        ..message = ""
        ..error = false
        ..todayTimes.replace([])
        ..tomorrowTimes.replace([])
        ..todayOrders.replace([])
        ..tomorrowOrders.replace([])
        ..isTodayOrdersTimesLoading = false
        ..isTomorrowOrdersTimesLoading = false
        ..isTodayTimeOrdersLoading = false
        ..isTomorrowTimeOrdersLoading = false,
    );
  }
}
