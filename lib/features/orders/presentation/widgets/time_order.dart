import 'package:beitouti_chefs/features/orders/domain/entities/time_order.dart';
import 'package:beitouti_chefs/features/orders/presentation/bloc/orders_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeOrderTile extends StatelessWidget {
  final TimeOrder timeOrder;
  final OrdersBloc bloc;

  const TimeOrderTile({Key? key, required this.timeOrder, required this.bloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${timeOrder.notes}",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
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
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ...timeOrder.meals.map(
                    (orderMeal) => Text(
                      "${orderMeal.name} ${orderMeal.quantity}",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  // Text(timeOrder.notes),
                ],
              ),
              TextButton(
                  onPressed: () {
                    bloc.addChangeStatusEvent(timeOrder.id,timeOrder.selectedDeliveryTime);
                  },
                  child: const Text("إنتهاء الطلب"))
            ],
          ),
        ),
      ],
    );
  }
}
