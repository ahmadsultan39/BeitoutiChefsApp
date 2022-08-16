import 'package:beitouti_chefs/core/usecase/usecase.dart';
import 'package:beitouti_chefs/features/orders/domain/use_cases/change_status.dart';
import 'package:beitouti_chefs/features/orders/domain/use_cases/get_orders_times.dart';
import 'package:beitouti_chefs/features/orders/domain/use_cases/get_time_order.dart';
import 'package:injectable/injectable.dart';

import 'orders.dart';
import 'package:bloc/bloc.dart';

@injectable
class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final GetOrdersTimesUseCase getOrdersTimesUseCase;
  final GetTimeOrdersUseCase getTimeOrdersUseCase;
  final ChangeStatusUseCase changeStatusUseCase;

  void addGetTodayOrdersTimesEvent() {
    add(GetTodayOrdersTimes());
  }

  void addGetTomorrowOrdersTimesEvent() {
    add(GetTomorrowOrdersTimes());
  }

  void addGetToadyTimeOrdersEvent(String time) {
    add(GetTodayTimeOrdersEvent((b) => b..time = time));
  }

  void addGetTomorrowTimeOrdersEvent(String time) {
    add(GetTomorrowTimeOrdersEvent((b) => b..time = time));
  }

  void addChangeStatusEvent(int orderId, String time) {
    add(
      ChangeStatusEvent((b) => b
        ..orderId = orderId
        ..time = time),
    );
  }

  void clearMessage() {
    add(ClearMessage());
  }

  @factoryMethod
  OrdersBloc(this.getOrdersTimesUseCase, this.getTimeOrdersUseCase,
      this.changeStatusUseCase)
      : super(OrdersState.initial()) {
    on<OrdersEvent>((event, emit) async {
      /// *** Get Today Orders Times *** //
      if (event is GetTodayOrdersTimes) {
        emit(state.rebuild((b) => b..isTodayOrdersTimesLoading = true));

        final result = await getOrdersTimesUseCase(
          const ParamsGetOrdersTimeUseCase(day: 'today'),
        );

        result.fold(
          (failure) => emit(
            state.rebuild(
              (b) => b
                ..isTodayOrdersTimesLoading = false
                ..error = true
                ..message = failure.error,
            ),
          ),
          (times) => emit(
            state.rebuild(
              (b) => b
                ..isTodayOrdersTimesLoading = false
                ..todayTimes.replace(times),
            ),
          ),
        );
      }

      /// *** Get Tomorrow Orders Times *** //
      if (event is GetTomorrowOrdersTimes) {
        emit(state.rebuild((b) => b..isTomorrowOrdersTimesLoading = true));

        final result = await getOrdersTimesUseCase(
          const ParamsGetOrdersTimeUseCase(day: 'tomorrow'),
        );

        result.fold(
          (failure) => emit(
            state.rebuild(
              (b) => b
                ..isTomorrowOrdersTimesLoading = false
                ..error = true
                ..message = failure.error,
            ),
          ),
          (times) => emit(
            state.rebuild(
              (b) => b
                ..isTomorrowOrdersTimesLoading = false
                ..tomorrowTimes.replace(times),
            ),
          ),
        );
      }

      /// *** Get Today Time Orders  *** //
      if (event is GetTodayTimeOrdersEvent) {
        emit(state.rebuild(
          (b) => b
            ..isTodayTimeOrdersLoading = true
            ..todayOrders.replace([]),
        ));

        final result = await getTimeOrdersUseCase(
          ParamsGetTimeOrdersUseCase(
            time: event.time,
            day: 'today',
          ),
        );

        result.fold(
          (failure) => emit(
            state.rebuild(
              (b) => b
                ..isTodayTimeOrdersLoading = false
                ..error = true
                ..message = failure.error,
            ),
          ),
          (orders) => emit(
            state.rebuild(
              (b) => b
                ..isTodayTimeOrdersLoading = false
                ..todayOrders.replace(orders),
            ),
          ),
        );
      }

      /// *** Get Tomorrow Time Orders  *** //
      if (event is GetTomorrowTimeOrdersEvent) {
        emit(state.rebuild(
          (b) => b
            ..isTomorrowTimeOrdersLoading = true
            ..tomorrowOrders.replace([]),
        ));

        final result = await getTimeOrdersUseCase(
          ParamsGetTimeOrdersUseCase(
            time: event.time,
            day: 'tomorrow',
          ),
        );

        result.fold(
          (failure) => emit(
            state.rebuild(
              (b) => b
                ..isTomorrowTimeOrdersLoading = false
                ..error = true
                ..message = failure.error,
            ),
          ),
          (orders) => emit(
            state.rebuild(
              (b) => b
                ..isTomorrowTimeOrdersLoading = false
                ..tomorrowOrders.replace(orders),
            ),
          ),
        );
      }

      /// *** Change Order Status  *** //
      if (event is ChangeStatusEvent) {
        emit(state.rebuild((b) => b..isLoading = true));

        final result = await changeStatusUseCase(
          ParamsChangeStatusUseCase(orderId: event.orderId),
        );

        result.fold(
          (failure) => emit(
            state.rebuild(
              (b) => b
                ..isLoading = false
                ..error = true
                ..message = failure.error,
            ),
          ),
          (_) {
            emit(
              state.rebuild(
                (b) => b..isLoading = false
                ..todayOrders.removeWhere((b) => b.id == event.orderId)
                ..tomorrowOrders.removeWhere((b) => b.id == event.orderId),
              ),
            );
          },
        );
      }

      /// *** ClearMessage *** ///
      if (event is ClearMessage) {
        emit(
          state.rebuild(
            (b) => b
              ..error = false
              ..message = '',
          ),
        );
      }
    });
  }
}
