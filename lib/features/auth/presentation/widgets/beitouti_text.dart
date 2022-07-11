import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BeitoutiText extends StatelessWidget {
  const BeitoutiText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 180.h,
      right: 25.w,
      child: Text(
        "بَيتُوتِي",
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 50.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
