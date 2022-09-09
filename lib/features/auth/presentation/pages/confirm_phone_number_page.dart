import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/form_entity.dart';
import '../widgets/page_view_item.dart';

class ConfirmPhoneNumberPage extends StatefulWidget {
  final TextEditingController pinCodeTextController;
  final VoidCallback onPressed;

  const ConfirmPhoneNumberPage({
    Key? key,
    required this.pinCodeTextController,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<ConfirmPhoneNumberPage> createState() => _ConfirmPhoneNumberPageState();
}

class _ConfirmPhoneNumberPageState extends State<ConfirmPhoneNumberPage> {
  final RegExp _validPinCodeExp = RegExp(r'[0-9]{4}$');
  bool _isPinCodeTextValid = false;
  String _pinCodeErrorMessage = '';

  void _pinCodeValidation(String code) {
    if (code.isEmpty) {
      setState(() {
        _isPinCodeTextValid = false;
        _pinCodeErrorMessage = 'الرجاء إدخال رمز التأكيد';
      });
    } else if (code.length != 4) {
      setState(() {
        _isPinCodeTextValid = false;
        _pinCodeErrorMessage = 'رمز التأكيد يجب أن يتكون من اربع خانات';
      });
    } else if (!_validPinCodeExp.hasMatch(code)) {
      setState(() {
        _isPinCodeTextValid = false;
        _pinCodeErrorMessage = 'الرجاء إدخال رمز تأكيد صالح';
      });
    } else if (!_isPinCodeTextValid) {
      setState(() {
        _isPinCodeTextValid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageViewItem(
      buttonText: 'تأكيد الرمز',
      onPressed: () {
        _pinCodeValidation(widget.pinCodeTextController.text);
        if (_isPinCodeTextValid) {
          widget.onPressed();
        }
      },
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormEntity(
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.number,
              upperLabel: "أدخل رمز التأكيد المُرسل إلى رقمك:",
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                ),
                child: SizedBox(
                  width: 250.w,
                  child: PinCodeTextField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    autoDisposeControllers: false,
                    controller: widget.pinCodeTextController,
                    appContext: context,
                    pinTheme: PinTheme.defaults(
                      selectedColor: Theme.of(context).primaryColor,
                      activeColor: Theme.of(context).primaryColor,
                      inactiveColor: Colors.grey,
                    ),
                    length: 4,
                    onChanged: _pinCodeValidation,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.h,
                right: 10.w,
              ),
              child: Row(
                children: [
                  Text(
                    _isPinCodeTextValid ? "" : _pinCodeErrorMessage,
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
      ],
    );
  }
}
