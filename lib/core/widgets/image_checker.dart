import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../util/constants.dart';
import 'custom_loader.dart';

class ImageChecker extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final bool circle;
  final double borderRadius;
  final Color borderColor;
  final BoxFit? fit;

  const ImageChecker({
    Key? key,
    required this.imageUrl,
    this.height,
    this.width,
    this.borderRadius = 0,
    this.circle = true,
    this.fit,
    this.borderColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 150.h,
      width: width ?? 150.w,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        shape: circle ? BoxShape.circle : BoxShape.rectangle,
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: circle ? null : BorderRadius.circular(borderRadius),
      ),
      child: imageUrl.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: Endpoints.url + imageUrl,
              errorWidget: (_, __, ___) => Icon(Icons.error, size: 25.sp),
              placeholder: (_, __) => Loader(size: 25.sp),
              height: height ?? 150.h,
              width: width ?? 150.w,
              fit: fit ?? BoxFit.cover,
            )
          : Image.asset(
              'assets/images/logo.png',
              color: Colors.grey,
              height: height ?? 150.h,
              width: width ?? 150.w,
              fit: fit ?? BoxFit.contain,
            ),
    );
  }
}
