import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultImage extends StatelessWidget {
  final double? height;
  final double? width;

  const DefaultImage({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/logo.png",
      color: Colors.grey,
      alignment: Alignment.center,
      width: width ?? 10.w,
      height: height ?? 10.h,
      fit: BoxFit.fitHeight,
    );
  }
}
