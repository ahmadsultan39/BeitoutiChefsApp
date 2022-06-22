import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DecoratedTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final String error;
  final bool isInputTextValid;

  // NULLABLE
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

  const DecoratedTextField({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.isInputTextValid,
    required this.error,
    this.contentPadding,
    this.enabled,
    this.onTap,
    this.height,
    this.fillColor,
    this.labelTextColor,
    this.labelTextSize,
    this.prefixIconColor,
    this.prefixIconSize,
    this.hintTextSize,
    this.hintTextColor,
    this.textInputType,
    this.textColor,
    this.textSize,
    this.cursorColor,
    this.labelText,
    this.hintText,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
          top: 15.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height ?? 60.h,
              child: TextField(
                // CONTROLLER
                controller: controller,

                // ON CHANGED
                onChanged: onChanged,

                // KEYBOARD INPUT TYPE
                keyboardType: textInputType,
                // (If null) Default set to TextInputType.text

                // INPUT TEXT STYLE
                style: TextStyle(
                  fontSize: textSize ?? 19.sp,
                  color: textColor ?? primaryColor,
                  fontWeight: FontWeight.w300,
                ),

                // TEXT ALIGN
                textAlignVertical: TextAlignVertical.center,

                enabled: enabled,

                // CURSOR COLOR
                cursorColor: cursorColor ?? primaryColor,

                // TEXT FIELD DECORATION
                decoration: InputDecoration(
                  // LABEL
                  labelText: labelText,
                  labelStyle: TextStyle(
                    color: labelTextColor ?? primaryColor,
                    fontSize: labelTextSize ?? 12.sp,
                  ),

                  // HINT
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: hintTextColor ?? Colors.grey,
                    fontSize: hintTextSize ?? 12.sp,
                    fontWeight: FontWeight.w300,
                  ),

                  // PREFIX
                  prefixIcon: prefixIcon != null
                      ? Icon(
                          prefixIcon,
                          color: prefixIconColor ?? primaryColor,
                          size: prefixIconSize ?? 15.sp,
                        )
                      : null,

                  // FILL COLOR
                  filled: true,
                  fillColor: fillColor ?? Colors.white,

                  contentPadding: contentPadding ??
                      EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),

                  // ENABLE BORDER
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.5),
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),

                  // ENABLE BORDER
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.5),
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),

                  // FOCUSED BORDER
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.h,
                right: 10.w,
                bottom: 10.h,
              ),
              child: Row(
                children: [
                  Text(
                    isInputTextValid ? "" : error,
                    style: TextStyle(
                      fontSize: 12.0.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
