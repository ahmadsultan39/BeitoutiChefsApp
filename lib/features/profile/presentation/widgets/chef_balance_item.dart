import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ChefBalanceItem extends StatelessWidget {
  final String title;
  final int ordersCount;
  final int balance;
  final int received;

  const ChefBalanceItem({
    Key? key,
    required this.received,
    required this.ordersCount,
    required this.balance,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 15.h,
      ),
      child: Container(
        width: 375.w,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(0, 5),
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Icon(
                    MdiIcons.cash,
                    color: Theme.of(context).colorScheme.primary,
                    size: 25.sp,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'الرصيد: ',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    balance.toString() + " ل.س",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Icon(
                    Icons.handshake_rounded,
                    color: Theme.of(context).colorScheme.primary,
                    size: 25.sp,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'الرصيد المسحوب: ',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    received.toString() + " ل.س",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Icon(
                    MdiIcons.numeric,
                    color: Theme.of(context).colorScheme.primary,
                    size: 25.sp,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'عدد الطلبات: ',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    ordersCount.toString(),
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
