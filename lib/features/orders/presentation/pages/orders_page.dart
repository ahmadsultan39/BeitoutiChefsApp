import 'package:beitouti_chefs/core/widgets/loader.dart';
import 'package:beitouti_chefs/features/orders/presentation/widgets/time_tile.dart';
import 'package:beitouti_chefs/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/orders.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final _bloc = sl<OrdersBloc>();

  @override
  void initState() {
    _bloc.addGetOrdersTimesEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc, OrdersState>(
      bloc: _bloc,
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    ...state.times
                        .map((time) => TimeTile(time: time, bloc: _bloc)),
                  ],
                ),
              ),
            ),
            if (state.isOrdersTimesLoading || state.isLoading) Loader(),
          ],
        );
      },
    );
  }
}
