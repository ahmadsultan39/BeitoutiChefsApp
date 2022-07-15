
import 'package:built_value/built_value.dart';

import '../../domain/entities/orders_times.dart';
import '../../domain/entities/time_order.dart';

part 'orders_state.g.dart';

abstract class OrdersState implements Built<OrdersState,OrdersStateBuilder> {
  bool get isLoading;

  String get message;

  bool get error;

  List<OrdersTimes> get times;

  List<TimeOrder> get orders;

  bool get isOrdersTimesLoading;

  bool get isTimeOrdersLoading;

  OrdersState._();

  factory OrdersState([Function(OrdersStateBuilder b) updates]) = _$OrdersState;

  factory OrdersState.initial() {
    return OrdersState(
          (b) => b
        ..isLoading = false
        ..message = ""
        ..error = false
        ..isOrdersTimesLoading = false
        ..isTimeOrdersLoading = false
        ..times =[]
        ..orders = [],
    );
  }
}

