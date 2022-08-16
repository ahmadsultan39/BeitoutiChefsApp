import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersTitle extends StatelessWidget {
  final String title;

  const OrdersTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 20.h,
      ),
      child: Row(
        children: [
          Icon(
            Icons.playlist_add_check,
            color: Theme.of(context).colorScheme.primary,
            size: 25.sp,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
    );
  }
}
