import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/form_entity.dart';
import '../widgets/page_view_item.dart';

class NameAndEmailPage extends StatefulWidget {
  final TextEditingController nameTextController;
  final TextEditingController emailTextController;
  final VoidCallback onPressed;

  const NameAndEmailPage({
    Key? key,
    required this.nameTextController,
    required this.emailTextController,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<NameAndEmailPage> createState() => _NameAndEmailPageState();
}

class _NameAndEmailPageState extends State<NameAndEmailPage> {
  /// User name attributes
  bool _isNameTextValid = false;
  String _nameErrorMessage = '';

  void _nameValidation(String name) {
    if (name.isEmpty) {
      setState(() {
        _isNameTextValid = false;
        _nameErrorMessage = 'الرجاء إدخال الإسم';
      });
    } else if (name.length < 7) {
      setState(() {
        _isNameTextValid = false;
        _nameErrorMessage = 'الإسم الثلاثي يجب أن يتكون من سبعة محارف أو أكثر';
      });
    } else if (!_isNameTextValid) {
      setState(() {
        _isNameTextValid = true;
      });
    }
  }

  /// Email attributes
  final RegExp _validEmailExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );
  bool _isEmailTextValid = false;
  String _emailErrorMessage = '';

  void _emailValidation(String email) {
    if (email.isEmpty) {
      setState(() {
        _isEmailTextValid = false;
        _emailErrorMessage = 'الرجاء إدخال بريد إلكتروني';
      });
    } else if (!_validEmailExp.hasMatch(email)) {
      setState(() {
        _isEmailTextValid = false;
        _emailErrorMessage = 'الرجاء إدخال بريد إلكتروني صالح';
      });
    } else if (!_isEmailTextValid) {
      setState(() {
        _isEmailTextValid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageViewItem(
      buttonText: "التالي",
      onPressed: () {
        _nameValidation(widget.nameTextController.text);
        _emailValidation(widget.emailTextController.text);
        if (_isEmailTextValid && _isNameTextValid) {
          widget.onPressed();
        }
      },
      children: [
        FormEntity(
          controller: widget.nameTextController,
          onChanged: _nameValidation,
          error: _nameErrorMessage,
          upperLabel: "الإسم الثلاثي",
          height: 40.h,
          prefixIcon: Icons.account_circle_rounded,
          isInputTextValid: _isNameTextValid,
        ),
        FormEntity(
          controller: widget.emailTextController,
          onChanged: _emailValidation,
          prefixIcon: Icons.email_rounded,
          textInputType: TextInputType.emailAddress,
          error: _emailErrorMessage,
          height: 40.h,
          upperLabel: "البريد الإلكتروني",
          isInputTextValid: _isEmailTextValid,
        ),
      ],
    );
  }
}
