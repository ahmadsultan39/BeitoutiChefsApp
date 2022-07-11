import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewItem extends StatelessWidget {
  final List<Widget> children;
  final String buttonText;
  final VoidCallback onPressed;

  const PageViewItem({
    Key? key,
    required this.children,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 350.h,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
          ),
          clipBehavior: Clip.hardEdge,
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor:
                  Theme.of(context).colorScheme.secondary.withOpacity(0.5),
              minimumSize: Size(150.w, 50.h),
              maximumSize: Size(150.w, 50.h),
            ),
          ),
        ),
      ],
    );
  }
}
