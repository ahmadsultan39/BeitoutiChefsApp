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

  void addGetOrdersTimesEvent() {
    add(GetOrdersTimesEvent());
  }

  void addGetTimeOrdersEvent(String time) {
    add(GetTimeOrdersEvent((b) => b..time = time));
  }

  void addChangeStatusEvent(int orderId,String time) {
    add(ChangeStatusEvent((b) => b..orderId = orderId..time = time));
  }

  void clearMessage() {
    add(ClearMessage());
  }

  @factoryMethod
  OrdersBloc(this.getOrdersTimesUseCase, this.getTimeOrdersUseCase, this.changeStatusUseCase) : super(OrdersState.initial()) {
    on<OrdersEvent>((event, emit) async {
      /// *** Get Orders Times *** //
      if (event is GetOrdersTimesEvent) {
        emit(state.rebuild((b) => b..isOrdersTimesLoading = true));

        final result = await getOrdersTimesUseCase(
          NoParams(),
        );

        result.fold(
          (failure) => emit(
            state.rebuild(
              (b) => b
                ..isOrdersTimesLoading = false
                ..error = true
                ..message = failure.error,
            ),
          ),
          (times) => emit(
            state.rebuild(
              (b) => b
                ..isOrdersTimesLoading = false
                ..times = times,
            ),
          ),
        );
      }


      /// *** Get Time Orders  *** //
      if (event is GetTimeOrdersEvent) {
        emit(state.rebuild((b) => b..isTimeOrdersLoading = true));

        final result = await getTimeOrdersUseCase(
          ParamsGetTimeOrdersUseCase(time: event.time),
        );

        result.fold(
          (failure) => emit(
            state.rebuild(
              (b) => b
                ..isTimeOrdersLoading = false
                ..error = true
                ..message = failure.error,
            ),
          ),
          (orders) => emit(
            state.rebuild(
              (b) => b
                ..isTimeOrdersLoading = false
                ..orders = orders,
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
              (b) => b
                ..isLoading = false
            ),
          );
            addGetTimeOrdersEvent(event.time);
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
