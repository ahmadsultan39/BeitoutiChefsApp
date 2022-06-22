import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'decorated_text_field.dart';

class FormEntity extends StatelessWidget {
  // TEXT FIELD
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? error;
  final bool? isInputTextValid;

  final String upperLabel;

  final TextInputType? textInputType;

  final IconData? prefixIcon;
  final Color? textColor;
  final Color? cursorColor;
  final Color? fillColor;
  final Color? labelTextColor;
  final Color? hintTextColor;
  final Color? prefixIconColor;
  final double? height;
  final double? textSize;
  final double? labelTextSize;
  final double? hintTextSize;
  final double? prefixIconSize;
  final String? labelText;
  final String? hintText;
  final EdgeInsets? contentPadding;
  final bool? enabled;
  final VoidCallback? onTap;
  final Widget? child;

  const FormEntity({
    Key? key,
    this.controller,
    this.onChanged,
    this.error,
    required this.upperLabel,
    this.isInputTextValid,
    this.contentPadding,
    this.enabled,
    this.onTap,
    this.textInputType,
    this.prefixIcon,
    this.textColor,
    this.cursorColor,
    this.fillColor,
    this.labelTextColor,
    this.hintTextColor,
    this.prefixIconColor,
    this.height,
    this.textSize,
    this.labelTextSize,
    this.hintTextSize,
    this.prefixIconSize,
    this.labelText,
    this.hintText,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          upperLabel,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
          ),
        ),
        child ??
            DecoratedTextField(
              enabled: enabled,
              onTap: onTap,
              contentPadding: contentPadding,
              controller: controller!,
              isInputTextValid: isInputTextValid!,
              error: error!,
              prefixIcon: prefixIcon,
              height: height,
              prefixIconColor: prefixIconColor,
              prefixIconSize: prefixIconSize,
              cursorColor: cursorColor,
              fillColor: fillColor,
              hintTextColor: hintTextColor,
              hintTextSize: hintTextSize,
              labelTextColor: labelTextColor,
              labelTextSize: labelTextSize,
              textColor: textColor,
              textSize: textSize,
              onChanged: onChanged!,
              textInputType: textInputType,
              labelText: labelText,
              hintText: hintText,
            ),
      ],
    );
  }
}
