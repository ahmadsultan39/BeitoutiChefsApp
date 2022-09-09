import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/custom_expansion_tile.dart';
import '../widgets/form_entity.dart';
import '../widgets/page_view_item.dart';

class OrderSettingsPage extends StatefulWidget {
  final String? deliveryStartsAt;
  final String? deliveryEndsAt;
  final Function(String) setDeliveryStartsAt;
  final Function(String) setDeliveryEndsAt;
  final TextEditingController maxMealsTextController;
  final VoidCallback onPressed;

  OrderSettingsPage({
    Key? key,
    required this.onPressed,
    required this.deliveryEndsAt,
    required this.deliveryStartsAt,
    required this.maxMealsTextController,
    required this.setDeliveryStartsAt,
    required this.setDeliveryEndsAt,
  }) : super(key: key);

  @override
  State<OrderSettingsPage> createState() => _OrderSettingsPageState();
}

class _OrderSettingsPageState extends State<OrderSettingsPage> {
  final RegExp _validMaxMeals = RegExp(r'[0-9]$');

  String? deliveryStartsAt;
  String? deliveryEndsAt;
  int maxMealsPerDay = 0;

  bool _isDeliveryStartsAtValid = true;
  final String _deliveryStartsAtErrorMessage = 'يرجى اختيار بداية وقت التوصيل';

  bool _isDeliveryEndsAtValid = true;
  final String _deliveryEndsAtErrorMessage = 'يرجى اختيار نهاية وقت التوصيل';

  bool _isMaxMealsTextValid = true;
  String _maxMealsErrorMessage = '';

  void _maxMealsValidation(String maxMeals) {
    if (widget.maxMealsTextController.text.isEmpty) {
      setState(() {
        _maxMealsErrorMessage = "الرجاء ادخال العدد الأعظمي للوجبات";
        _isMaxMealsTextValid = false;
      });
    } else if (!_validMaxMeals.hasMatch(widget.maxMealsTextController.text)) {
      setState(() {
        _maxMealsErrorMessage = "عدد الوجبات الأعظمي يجب أن يكون رقماً";
        _isMaxMealsTextValid = false;
      });
    } else if (int.parse(widget.maxMealsTextController.text) <= 0) {
      setState(() {
        _maxMealsErrorMessage =
            "عدد الوجبات الأعظمي يجب أن أكبر تماماً من الصفر";
        _isMaxMealsTextValid = false;
      });
    } else {
      setState(() {
        _isMaxMealsTextValid = true;
        _maxMealsErrorMessage = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageViewItem(
      buttonText: "التالي",
      onPressed: () {
        _maxMealsValidation(widget.maxMealsTextController.text);
        if (widget.deliveryStartsAt == null) {
          setState(() {
            _isDeliveryStartsAtValid = false;
          });
        }
        if (widget.deliveryEndsAt == null) {
          setState(() {
            _isDeliveryEndsAtValid = false;
          });
        }
        if (_isMaxMealsTextValid &&
            widget.deliveryStartsAt != null &&
            widget.deliveryEndsAt != null) {
          widget.onPressed();
        }
      },
      children: [
        FormEntity(
          upperLabel: "عدد الوجبات الأعظمي في اليوم",
          onChanged: _maxMealsValidation,
          error: _maxMealsErrorMessage,
          textInputType: TextInputType.number,
          isInputTextValid: _isMaxMealsTextValid,
          controller: widget.maxMealsTextController,
        ),
        Row(
          children: [
            Text(
              "بداية وقت التوصيل",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(width: 15.w),
            DropdownButton<String>(
              menuMaxHeight: 250.h,
              hint: const Text("من"),
              value: widget.deliveryStartsAt != null
                  ? int.parse(widget.deliveryStartsAt!.split(":").first) <= 9
                      ? widget.deliveryStartsAt!.split(":").first[1]
                      : widget.deliveryStartsAt!.split(":").first
                  : null,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: [
                "0",
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
                "8",
                "9",
                "10",
                "11",
                "12",
                "13",
                "14",
                "15",
                "16",
                "17",
                "18",
                "19",
                "20",
                "21",
                "22",
                "23",
              ].map((items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  widget.setDeliveryStartsAt(
                    int.parse(newValue!) <= 9
                        ? "0" + newValue + ":00:00"
                        : newValue + ":00:00",
                  );
                  _isDeliveryStartsAtValid = true;
                });
              },
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 5.h,
          ),
          child: Row(
            children: [
              Text(
                _isDeliveryStartsAtValid ? "" : _deliveryStartsAtErrorMessage,
                style: TextStyle(
                  fontSize: 12.0.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Text(
              "نهاية وقت التوصيل",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(width: 15.w),
            DropdownButton<String>(
              menuMaxHeight: 250.h,
              hint: const Text("إلى"),
              value: widget.deliveryEndsAt != null
                  ? widget.deliveryEndsAt!.split(":").first
                  : null,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: [
                "0",
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
                "8",
                "9",
                "10",
                "11",
                "12",
                "13",
                "14",
                "15",
                "16",
                "17",
                "18",
                "19",
                "20",
                "21",
                "22",
                "23",
              ].map((items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  widget.setDeliveryEndsAt(newValue! + ":00:00");
                  _isDeliveryEndsAtValid = true;
                });
              },
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 5.h,
          ),
          child: Row(
            children: [
              Text(
                _isDeliveryEndsAtValid ? "" : _deliveryEndsAtErrorMessage,
                style: TextStyle(
                  fontSize: 12.0.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),

        // Row(
        //   children: [
        //     const Text("العدد الأعظمي للتحضير"),
        //     SizedBox(
        //       width: 35.w,
        //       child: Container(
        //         clipBehavior: Clip.none,
        //         child: TextField(
        //           controller: widget.maxMealsTextController,
        //           textAlign: TextAlign.center,
        //         ),
        //       ),
        //     ),
        //     const Text("وجبة")
        //   ],
        // ),
        // FormEntity(
        //   upperLabel: 'أرفق رخصة إن وجدت',
        //   child: GestureDetector(
        //     onTap: widget.pickFile,
        //     child: Container(
        //       width: 200,
        //       height: 5,
        //       color: Theme.of(context).backgroundColor,
        //       child: Text("File name"),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
