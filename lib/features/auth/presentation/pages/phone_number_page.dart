import 'package:flutter/material.dart';
import '../widgets/form_entity.dart';
import '../widgets/page_view_item.dart';

class PhoneNumberPage extends StatefulWidget {
  final TextEditingController phoneNumberTextController;
  final VoidCallback onPressed;

  const PhoneNumberPage({
    Key? key,
    required this.phoneNumberTextController,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  final RegExp _validPhoneNumberExp = RegExp(r'[0-9]{10}$');
  bool _isPhoneNumberTextValid = false;
  String _phoneNumberErrorMessage = '';

  void _phoneNumberValidation(String phoneNumber) {
    if (phoneNumber.isEmpty) {
      setState(() {
        _isPhoneNumberTextValid = false;
        _phoneNumberErrorMessage = 'الرجاء إدخال رقم الهاتف المحمول';
      });
    } else if (!phoneNumber.startsWith('09')) {
      setState(() {
        _isPhoneNumberTextValid = false;
        _phoneNumberErrorMessage = 'الرقم يجب أن يبدأ بـ 09';
      });
    } else if (phoneNumber.length != 10) {
      setState(() {
        _isPhoneNumberTextValid = false;
        _phoneNumberErrorMessage = 'الرقم يجب أن يتكون من عشر خانات';
      });
    } else if (!_validPhoneNumberExp.hasMatch(phoneNumber)) {
      setState(() {
        _isPhoneNumberTextValid = false;
        _phoneNumberErrorMessage = 'الرجاء إدخال رقم صالح';
      });
    } else if (!_isPhoneNumberTextValid) {
      setState(() {
        _isPhoneNumberTextValid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageViewItem(
      onPressed: () {
        _phoneNumberValidation(widget.phoneNumberTextController.text);
        if (_isPhoneNumberTextValid) {
          widget.onPressed();
        }
      },
      buttonText: 'تأكيد الرقم',
      children: [
        FormEntity(
          upperLabel: 'أدخل رقم هاتفك المحمول',
          labelText: 'الهاتف المحمول',
          hintText: '********09',
          prefixIcon: Icons.phone,
          textInputType: TextInputType.phone,
          controller: widget.phoneNumberTextController,
          error: _phoneNumberErrorMessage,
          isInputTextValid: _isPhoneNumberTextValid,
          onChanged: _phoneNumberValidation,
        ),
      ],
    );
  }
}
