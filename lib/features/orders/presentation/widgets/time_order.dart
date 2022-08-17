import 'package:beitouti_chefs/core/widgets/image_checker.dart';
import 'package:beitouti_chefs/features/orders/domain/entities/time_order.dart';
import 'package:beitouti_chefs/features/orders/presentation/bloc/orders_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeOrderTile extends StatelessWidget {
  final TimeOrder timeOrder;
  final OrdersBloc bloc;
  final bool today;

  const TimeOrderTile({
    Key? key,
    required this.timeOrder,
    required this.bloc,
    this.today = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white, //Theme.of(context).colorScheme.background,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        children: [
          OrderDetails(
            title: 'رقم الطلب',
            value: timeOrder.id.toString(),
            icon: Icons.numbers_outlined,
          ),
          SizedBox(
            height: 5.h,
          ),
          OrderDetails(
            title: 'ملاحظات الطلب',
            value: timeOrder.notes ?? "لايوجد",
            icon: Icons.notes,
          ),
          SizedBox(
            height: 10.h,
          ),
          ...timeOrder.meals.map(
            (meal) => Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                //Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ImageChecker(
                      imageUrl: meal.image,
                      width: 60.w,
                      height: 50.h,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              meal.name + ":",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              " عدد ${meal.quantity}",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.tertiary,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ملاحظات: ',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(
                              width: 175.w,
                              child: Text(
                                meal.notes ?? "لا يوجد",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).colorScheme.tertiary,
                                  fontSize: 14.sp,
                                ),
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          if (today)
            GestureDetector(
              onTap: () {
                bloc.addChangeStatusEvent(
                  timeOrder.id,
                  timeOrder.selectedDeliveryTime,
                );
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "إنتهاء الطلب",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class OrderDetails extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const OrderDetails({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
          size: 22.sp,
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          title + ": ",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(
          width: 190.w,
          child: Text(
            value,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 14.sp,
            ),
            overflow: TextOverflow.fade,
          ),
        ),
      ],
    );
  }
}
