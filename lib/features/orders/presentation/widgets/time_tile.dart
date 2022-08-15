import 'package:beitouti_chefs/core/widgets/loader.dart';
import 'package:beitouti_chefs/features/orders/presentation/bloc/orders_bloc.dart';
import 'package:beitouti_chefs/features/orders/presentation/widgets/time_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/orders_times.dart';
import '../bloc/orders_state.dart';

class TimeTile extends StatelessWidget {
  final OrdersTimes time;
  final OrdersBloc bloc;

  const TimeTile({Key? key, required this.time, required this.bloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              bloc.addGetTimeOrdersEvent(time.clock);
              return BlocBuilder<OrdersBloc, OrdersState>(
                bloc: bloc,
                builder: (context, state) {
                  return Container(
                    constraints: BoxConstraints(
                      maxHeight: 700.h,
                      minHeight: 400.h,
                    ),
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              ...bloc.state.orders.map(
                                (timeOrder) => TimeOrderTile(
                                  timeOrder: timeOrder,
                                  bloc: bloc,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (state.isTimeOrdersLoading) const Loader()
                      ],
                    ),
                  );
                },
              );
            });
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(20),
        // height: 275.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0),
                blurRadius: 6.0,
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time.clock.split(" ").last,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            SizedBox(
              height: 10.h,
            ),
            ...time.meals.map((meal) => Row(
                  children: [
                    Text(
                      " - ${meal.name}",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      " ${meal.quantity}",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
