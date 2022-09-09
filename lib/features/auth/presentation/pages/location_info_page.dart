import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/custom_expansion_tile.dart';
import '../widgets/form_entity.dart';
import '../widgets/page_view_item.dart';

class LocationInfoPage extends StatefulWidget {
  final TextEditingController birthDateTextController;
  final TextEditingController locationTextController;
  final Function(int) genderController;
  final VoidCallback pickFile;
  final VoidCallback onPressed;

  const LocationInfoPage({
    Key? key,
    required this.birthDateTextController,
    required this.locationTextController,
    required this.genderController,
    required this.onPressed,
    required this.pickFile,
  }) : super(key: key);

  @override
  State<LocationInfoPage> createState() => _LocationInfoPageState();
}

class _LocationInfoPageState extends State<LocationInfoPage> {
  final RegExp _validNumberExp = RegExp(r'[0-9]$');

  bool _isBirthDateTextValid = false;
  String _birthDateErrorMessage = '';

  final GlobalKey<CustomExpansionTileState> key = GlobalKey();

  void _birthDateValidation(String birthDate) {
    if (birthDate.isEmpty) {
      setState(() {
        _isBirthDateTextValid = false;
        _birthDateErrorMessage = 'الرجاء إدخال تاريخ الميلاد';
      });
    } else if (!_isBirthDateTextValid) {
      setState(() {
        _isBirthDateTextValid = true;
      });
    }
  }

  final List<String> _genders = [
    'ذكر',
    'أنثى',
  ];

  bool _isGenderChanged = true;
  String _selectedGender = 'الرجاء اختيار الجنس';

  bool _isLocationTextValid = false;
  String _locationErrorMessage = '';

  void _locationValidation(String location) {
    if (location.isEmpty) {
      setState(() {
        _isLocationTextValid = false;
        _locationErrorMessage = 'الرجاء إدخال العنوان';
      });
    } else if (!_isLocationTextValid) {
      setState(() {
        _isLocationTextValid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageViewItem(
      buttonText: "التالي",
      onPressed: () {
        _locationValidation(widget.locationTextController.text);
        _birthDateValidation(widget.birthDateTextController.text);
        if (_selectedGender == 'الرجاء اختيار الجنس') {
          setState(() {
            _isGenderChanged = false;
          });
        } else if (_isBirthDateTextValid && _isLocationTextValid) {
          widget.onPressed();
        }
      },
      children: [
        FormEntity(
          upperLabel: 'العنوان',
          controller: widget.locationTextController,
          onChanged: _locationValidation,
          error: _locationErrorMessage,
          height: 40.h,
          prefixIcon: Icons.location_on_rounded,
          isInputTextValid: _isLocationTextValid,
        ),
        FormEntity(
          textInputAction: TextInputAction.done,
          controller: widget.birthDateTextController,
          onChanged: _birthDateValidation,
          error: _birthDateErrorMessage,
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1980),
              lastDate: DateTime.now(),
            );
            if (date != null) {
              setState(() {
                widget.birthDateTextController.text =
                    DateFormat('yyyy-MM-dd').format(date);
              });
            }
          },
          prefixIcon: Icons.date_range_rounded,
          enabled: false,
          upperLabel: "تاريخ الميلاد",
          isInputTextValid: _isBirthDateTextValid,
          height: 40.h,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          textSize: 15.sp,
        ),
        FormEntity(
          upperLabel: 'الجنس',
          child: Column(
            children: [
              CustomExpansionTile(
                key: key,
                title: Text(
                  _selectedGender,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: _isGenderChanged
                        ? Theme.of(context).primaryColor
                        : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                children: [
                  ..._genders
                      .map(
                        (gender) => GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              _isGenderChanged = true;
                              _selectedGender = gender;
                              widget.genderController(_genders.indexOf(gender));
                              key.currentState?.collapse();
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 5.h,
                            ),
                            child: Text(
                              gender,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: _selectedGender == gender
                                    ? Theme.of(context).colorScheme.tertiary
                                    : Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ],
                backgroundColor: Colors.white,
                expandedAlignment: Alignment.centerRight,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                collapsedBackgroundColor: Colors.white,
                childrenPadding: EdgeInsets.symmetric(horizontal: 20.w),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 10.h,
                  right: 10.w,
                ),
                child: Row(
                  children: [
                    Text(
                      _isGenderChanged ? "" : "الرجاء اختيار الجنس",
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
      ],
    );
  }
}
