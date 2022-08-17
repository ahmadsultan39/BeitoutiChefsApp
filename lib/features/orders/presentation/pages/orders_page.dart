import 'package:beitouti_chefs/core/widgets/custom_loader.dart';
import 'package:beitouti_chefs/features/orders/presentation/widgets/empty_orders_list.dart';
import 'package:beitouti_chefs/features/orders/presentation/widgets/time_tile.dart';
import 'package:beitouti_chefs/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/orders.dart';
import '../widgets/orders_title.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final _bloc = sl<OrdersBloc>();

  @override
  void initState() {
    _bloc.addGetTodayOrdersTimesEvent();
    _bloc.addGetTomorrowOrdersTimesEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc, OrdersState>(
      bloc: _bloc,
      builder: (context, state) {
        return Stack(
          children: [
            RefreshIndicator(
              onRefresh: () async {
                _bloc.addGetTodayOrdersTimesEvent();
                _bloc.addGetTomorrowOrdersTimesEvent();
              },
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const OrdersTitle(title: 'طلبات اليوم'),
                    ...state.todayTimes.map(
                      (time) => TimeTile(
                        bloc: _bloc,
                        today: true,
                        time: time,
                      ),
                    ),
                    if (!state.isTodayOrdersTimesLoading &&
                        state.todayTimes.isEmpty)
                      const EmptyOrdersList(
                        text:
                            "لا يوجد طلبات لهذا اليوم\nفي حال وجود طلبات هذا اليوم ستعرض هنا",
                      ),
                    if (state.isTodayOrdersTimesLoading) const Loader(),
                    const OrdersTitle(title: 'طلبات الغد'),
                    ...state.tomorrowTimes.map(
                      (time) => TimeTile(
                        bloc: _bloc,
                        time: time,
                        today: false,
                      ),
                    ),
                    if (!state.isTomorrowOrdersTimesLoading &&
                        state.tomorrowTimes.isEmpty)
                      const EmptyOrdersList(
                        text:
                            "لا يوجد طلبات ليوم الغد\nفي حال وجود طلبات ليوم الغد ستعرض هنا",
                      ),
                    SizedBox(height: 15.h),
                    if (state.isTomorrowOrdersTimesLoading) const Loader(),
                  ],
                ),
              ),
            ),
            if (state.isLoading) const Loader(),
          ],
        );
      },
    );
  }
}
