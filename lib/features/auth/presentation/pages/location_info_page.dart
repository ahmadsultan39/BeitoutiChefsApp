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

  /// User name attributes
  bool _isLocationTextValid = false;
  String _locationErrorMessage = '';

  void _locationValidation(String location) {
    if (location.isEmpty) {
      setState(() {
        _isLocationTextValid = false;
        _locationErrorMessage = 'الرجاء إدخال الموقع';
      });
    }
    // else if (name.length < 7) {
    //   setState(() {
    //     _isNameTextValid = false;
    //     _nameErrorMessage = 'الإسم الثلاثي يجب أن يتكون من سبعة محارف أو أكثر';
    //   });
    // }
    else if (!_isLocationTextValid) {
      setState(() {
        _isLocationTextValid = true;
      });
    }
  }

  // TransportationType
  final List<String> _gendersList = [
    'ذكر',
    'أنثى',
  ];
  bool _isGenderChanged = false;
  String _gender = 'الرجاء اختيار الجنس';
  final GlobalKey<CustomExpansionTileState> _genderKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return PageViewItem(
      buttonText: "التالي",
      onPressed: () {
        if (widget.birthDateTextController.text.isNotEmpty) {
          widget.onPressed();
        }
      },
      children: [
        FormEntity(
          upperLabel: 'الموقع',
          controller: widget.locationTextController,
          onChanged: _locationValidation,
          error: _locationErrorMessage,
          height: 40.h,
          prefixIcon: Icons.location_on_rounded,
          isInputTextValid: _isLocationTextValid,
        ),
        FormEntity(
          controller: widget.birthDateTextController,
          onChanged: (text) {},
          error: '',
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
          isInputTextValid: true,
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
                key: _genderKey,
                title: Text(
                  _gender,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: _isGenderChanged
                        ? Theme.of(context).primaryColor
                        : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                children: [
                  ..._gendersList
                      .map(
                        (gender) => GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              _isGenderChanged = true;
                              _gender = gender;
                              widget.genderController(
                                _gendersList.indexOf(gender),
                              );
                              _genderKey.currentState?.collapse();
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
                                color: _gender == gender
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
        FormEntity(
          upperLabel: 'أرفق رخصة إن وجدت',
          child: GestureDetector(
            onTap: widget.pickFile,
            child: Container(
              width: 200,
              height: 100,
              color: Theme.of(context).backgroundColor,
              child: Text("File name"),
            ),
          ),
        ),
        SizedBox(
          height: 200.h,
        ),
      ],
    );
  }
}
