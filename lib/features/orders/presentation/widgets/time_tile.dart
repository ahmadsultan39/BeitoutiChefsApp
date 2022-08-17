import 'package:beitouti_chefs/core/widgets/custom_loader.dart';
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
  final bool today;

  const TimeTile({
    Key? key,
    required this.time,
    required this.bloc,
    required this.today,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          context: context,
          builder: (context) {
            if (today) {
              bloc.addGetToadyTimeOrdersEvent(time.clock);
            } else {
              bloc.addGetTomorrowTimeOrdersEvent(time.clock);
            }
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
                      if (state.todayOrders.isEmpty && !state.isTodayTimeOrdersLoading)
                      const Center(
                        child: Text(
                          "تم إعداد جميع الطلبات لهذه الساعة",
                        ),
                      ),
                      if (state.tomorrowOrders.isEmpty && !state.isTomorrowTimeOrdersLoading)
                        const Center(
                          child: Text(
                            "تم إعداد جميع الطلبات لهذه الساعة",
                          ),
                        ),
                      if ((state.todayOrders.isNotEmpty && today) ||
                          (state.tomorrowOrders.isNotEmpty && !today))
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 20.h,
                                  bottom: 20.h,
                                ),
                                child: Text(
                                  "تفاصيل الطلبات",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ),
                              if (today)
                              ...bloc.state.todayOrders.map(
                                (timeOrder) => TimeOrderTile(
                                  timeOrder: timeOrder,
                                  bloc: bloc,
                                ),
                              ),
                              if (!today)
                              ...bloc.state.tomorrowOrders.map(
                                (timeOrder) => TimeOrderTile(
                                  timeOrder: timeOrder,
                                  bloc: bloc,
                                  today: today,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (state.isLoading) const Loader(),
                      if ((state.isTodayTimeOrdersLoading && today) ||
                          (state.isTomorrowTimeOrdersLoading && !today))
                        const Loader()
                    ],
                  ),
                );
              },
            );
          },
        );
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 5.h,
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
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
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "موعد الطلب: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    time.clock.split(" ").last,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              ...time.meals.map(
                (meal) => Row(
                  children: [
                    Text(
                      " - ${meal.name}",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      " عدد ${meal.quantity}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.tertiary,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "* يوجد ملاحظات",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
