import 'package:beitouti_chefs/features/auth/presentation/pages/phone_number_page.dart';
import 'package:beitouti_chefs/features/auth/presentation/pages/location_info_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/enums.dart';
import '../../../../core/util/generate_screen.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../../core/widgets/custom_loader.dart';
import '../../../../core/widgets/decor.dart';
import '../../../../injection.dart';
import '../../domain/entities/request_register.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';
import '../widgets/beitouti_text.dart';
import 'confirm_phone_number_page.dart';
import 'name_and_email_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _bloc = sl<AuthBloc>();

  // Page View
  final PageController _pageController = PageController();
  final _duration = const Duration(milliseconds: 300);
  final _curve = Curves.fastOutSlowIn;

  // Phone Number
  final TextEditingController _phoneNumberTextController =
      TextEditingController();

  // Pin Code
  final TextEditingController _pinCodeTextController = TextEditingController();

  // Name
  final TextEditingController _nameTextController = TextEditingController();

  // Email
  final TextEditingController _emailTextController = TextEditingController();

  // Location
  final TextEditingController _locationTextController = TextEditingController();

  // Birth Date
  final TextEditingController _birthDateController = TextEditingController();

  // Campus Location
  late StudentLocation _studentLocation;

  // National Id
  final TextEditingController _nationalIdTextController =
      TextEditingController();

  // Campus Unit number
  final TextEditingController _campusUnitNumberTextController =
      TextEditingController();

  // Campus Card Id
  final TextEditingController _campusCardIdTextController =
      TextEditingController();

  // Study Specialty
  final TextEditingController _studySpecialtyTextController =
      TextEditingController();

  // Birth Date
  final TextEditingController _birthDate = TextEditingController();

  // Study Year
  final TextEditingController _studyYearTextController =
      TextEditingController();

  // Gender
  late final Gender _gender;

  late final FilePickerResult _filePickerResult;

  @override
  void initState() {
    _pageController.addListener(() {
      if (_pageController.page == 2.0) {
        print('Get Current Location');
        _bloc.addGetCurrentLocationEvent();
      }
    });
    super.initState();
  }

  void _animateToFirstPage(double? page) {
    setState(() {
      _pageController.animateTo(
        page ?? 0.0,
        duration: _duration,
        curve: _curve,
      );
      _emailTextController.clear();
      _pinCodeTextController.clear();
    });
  }

  void _goToNextPage() {
    setState(() {
      _pageController.nextPage(
        duration: _duration,
        curve: _curve,
      );
    });
  }

  void _setStudentLocation(int locationNumber) {
    setState(() {
      _studentLocation = StudentLocation.values[locationNumber];
    });
  }

  void _pickFile() {
    _bloc.addPickFileEvent();
  }

  void _setGender(int gender) {
    setState(() {
      _gender = Gender.values[gender];
    });
  }

  void _sendCode() {
    _bloc.addSendCodeEvent(phoneNumber: _phoneNumberTextController.text);
  }

  void _checkCodeAndAccessibility() {
    _bloc.addCheckCodeEvent(
      phoneNumber: _phoneNumberTextController.text,
      code: _pinCodeTextController.text,
    );
  }

  void _requestRegister() {
    final RegisterRequest _request;
    if (_bloc.state.filePickerResult != null) {
      _request = RegisterRequest(
        name: _nameTextController.text,
        email: _emailTextController.text,
        phoneNumber: _phoneNumberTextController.text,
        birthDate: _birthDateController.text,
        location: _locationTextController.text,
        gender: Gender.male,
        latitude: _bloc.state.locationData!.latitude!,
        longitude: _bloc.state.locationData!.longitude!,
        deliveryStartsAt: '10:00:00',
        deliveryEndsAt: '15:00:00',
        maxMealsPerDay: 10,
        certificatePath: _bloc.state.filePickerResult!.files.first.path,
        certificateName: _bloc.state.filePickerResult!.files.first.name,
      );
    } else {
      _request = RegisterRequest(
        name: _nameTextController.text,
        email: _emailTextController.text,
        phoneNumber: _phoneNumberTextController.text,
        birthDate: _birthDateController.text,
        location: _locationTextController.text,
        gender: Gender.male,
        latitude: _bloc.state.locationData!.latitude!,
        longitude: _bloc.state.locationData!.longitude!,
        deliveryStartsAt: '10:00:00',
        deliveryEndsAt: '15:00:00',
        maxMealsPerDay: 10,
      );
    }

    _bloc.addRequestRegisterEvent(
      request: _request,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).backgroundColor,
        body: BlocListener<AuthBloc, AuthState>(
          bloc: _bloc,
          listener: (context, state) {
            if (state.isCodeSent && _pageController.page == 0.0) {
              // Code now is sent and we are waiting for message
              _goToNextPage();
            }
            if (state.isCodeValid && _pageController.page == 1.0) {
              // Code is right, Now we must check accessibility status
              if (state.accessibilityStaysType ==
                  AccessibilityStaysType.active) {
                WidgetsBinding.instance?.addPostFrameCallback(
                  (_) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      NameScreen.homeScreen,
                      (_) => false,
                    );
                  },
                );
              }
              if (state.accessibilityStaysType ==
                  AccessibilityStaysType.blocked) {
                showDialog(
                  context: context,
                  builder: (_) => CustomDialog(
                    content: 'عزيزي الطالب،\n هذا الحساب محظور',
                    title: Icon(
                      Icons.block_outlined,
                      color: Theme.of(context).colorScheme.primary,
                      size: 35.sp,
                    ),
                  ),
                );
              }

              if (state.accessibilityStaysType ==
                  AccessibilityStaysType.isRejected) {
                showDialog(
                  context: context,
                  builder: (_) => CustomDialog(
                    content: 'عزيزي الطالب،\n لقد تم رفض طلب انضمامك',
                    title: Icon(
                      Icons.no_accounts,
                      color: Theme.of(context).colorScheme.primary,
                      size: 35.sp,
                    ),
                  ),
                );
              }
              if (state.accessibilityStaysType ==
                  AccessibilityStaysType.notApproved) {
                _animateToFirstPage(0.0);
                showDialog(
                  context: context,
                  builder: (_) => CustomDialog(
                    content: 'عزيزي الطالب،\n طلب انضمامك قيد المراجعة حالياً',
                    title: Icon(
                      Icons.lock_clock,
                      color: Theme.of(context).colorScheme.primary,
                      size: 35.sp,
                    ),
                  ),
                );
              }
              if (state.accessibilityStaysType ==
                  AccessibilityStaysType.notRegistered) {
                // Navigator to next page;
                _goToNextPage();
                _bloc.addGetCurrentLocationEvent();
              }
            }
            if (state.isRegisterRequestSent) {
              _bloc.reInitializeState();
              setState(
                () {
                  _pageController.jumpToPage(0);
                },
              );
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            bloc: _bloc,
            builder: (context, state) {
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                message(
                  message: state.message,
                  isError: state.error,
                  context: context,
                  bloc: _bloc,
                );
              });
              return Stack(
                alignment: Alignment.center,
                children: [
                  const Decor(),
                  const BeitoutiText(),
                  Positioned(
                    top: 220.h,
                    child: SizedBox(
                      height: 500.h,
                      width: 375.w,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.w,
                        ),
                        child: PageView(
                          controller: _pageController,
                          // physics: const NeverScrollableScrollPhysics(),
                          reverse: true, //Because arabic is from right to left
                          children: [
                            PhoneNumberPage(
                              phoneNumberTextController:
                                  _phoneNumberTextController,
                              onPressed: _sendCode, //_sendCode,
                            ),
                            ConfirmPhoneNumberPage(
                              pinCodeTextController: _pinCodeTextController,
                              onPressed: _checkCodeAndAccessibility,
                            ),
                            NameAndEmailPage(
                              nameTextController: _nameTextController,
                              emailTextController: _emailTextController,
                              onPressed: _goToNextPage,
                            ),
                            LocationInfoPage(
                              locationTextController: _locationTextController,
                              birthDateTextController: _birthDateController,
                              genderController: _setGender,
                              onPressed: _requestRegister,
                              pickFile: _pickFile,
                            ),
                            // CampusInformationPage(
                            //   nationalIdTextController:
                            //   _nationalIdTextController,
                            //   campusCardIdTextController:
                            //   _campusCardIdTextController,
                            //   campusExpiryDateTextController:
                            //   _campusExpiryDateTextController,
                            //   campusUnitNumberTextController:
                            //   _campusUnitNumberTextController,
                            //   campusLocationController: _setStudentLocation,
                            //   onPressed: _goToNextPage,
                            // ),
                            // StudyInfoPage(
                            //   studySpecialtyTextController:
                            //   _studySpecialtyTextController,
                            //   studyYearTextController: _studyYearTextController,
                            //   birthDateTextController: _birthDateController,
                            //   genderController: _setGender,
                            //   onPressed: _requestRegister,
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (state.isLoading) const Loader(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
