import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialog extends StatelessWidget {
  final String content;
  final Widget title;
  final String? buttonText;
  final VoidCallback? onTap;

  const CustomDialog({
    Key? key,
    required this.content,
    required this.title,
    this.onTap,
    this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      clipBehavior: Clip.hardEdge,
      backgroundColor: theme.backgroundColor,
      alignment: Alignment.center,
      title: title,
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: theme.colorScheme.primary,
          height: 2.0,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 15.h,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: EdgeInsets.only(
        bottom: 10.h,
      ),
      actions: [
        GestureDetector(
          onTap: onTap ??
              () {
                Navigator.pop(context);
              },
          child: Container(
            width: 90.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary.withOpacity(0.6),
              borderRadius: const BorderRadius.all(Radius.circular(32)),
            ),
            child: Center(
              child: Text(
                buttonText ?? "عودة",
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
