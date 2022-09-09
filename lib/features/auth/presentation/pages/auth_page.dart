import 'package:beitouti_chefs/core/widgets/keyboard_avoider.dart';
import 'package:beitouti_chefs/features/auth/presentation/pages/certificate_and_picture_page.dart';
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

import 'order_settings_page.dart';
import 'phone_number_page.dart';
import 'location_info_page.dart';
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

  // National Id
  final TextEditingController _nationalIdTextController =
      TextEditingController();

  final TextEditingController _maxMealsTextController = TextEditingController();

  String? _deliveryStartsAt;

  String? _deliveryEndsAt;

  Gender? _gender;

  late final FilePickerResult _filePickerResult;

  @override
  void initState() {
    _pageController.addListener(() {
      if (_pageController.page == 2.0) {
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

  void _pickFile() {
    _bloc.addPickFileEvent();
  }

  void _pickProfilePicture() {
    _bloc.addPickProfilePictureEvent();
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

    _request = RegisterRequest(
      name: _nameTextController.text,
      email: _emailTextController.text,
      phoneNumber: _phoneNumberTextController.text,
      birthDate: _birthDateController.text,
      location: _locationTextController.text,
      gender: _gender!,
      latitude: _bloc.state.locationData!.latitude!,
      longitude: _bloc.state.locationData!.longitude!,
      deliveryStartsAt: _deliveryStartsAt!,
      deliveryEndsAt: _deliveryEndsAt!,
      maxMealsPerDay: int.parse(_maxMealsTextController.text),
      certificatePath: _bloc.state.filePickerResult?.files.first.path,
      certificateName: _bloc.state.filePickerResult?.files.first.name,
      profilePictureName: _bloc.state.profilePictureFile?.files.first.name,
      profilePicturePath: _bloc.state.profilePictureFile?.files.first.path,
    );

    _bloc.addRequestRegisterEvent(
      request: _request,
    );
  }

  void _setDeliveryStartsAt(String value) {
    setState(() {
      _deliveryStartsAt = value;
    });
  }

  void _setDeliveryEndsAt(String value) {
    setState(() {
      _deliveryEndsAt = value;
    });
  }

  void _reInitControllers() {
    setState(() {
      _phoneNumberTextController.clear();
      _pinCodeTextController.clear();
      _nameTextController.clear();
      _emailTextController.clear();
      _locationTextController.clear();
      _birthDateController.clear();
      _nationalIdTextController.clear();
      _deliveryStartsAt = null;
      _deliveryEndsAt = null;
      _maxMealsTextController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_pageController.page == 1.0) {
          _bloc.reInitializeState();
          _pageController.animateToPage(
            0,
            duration: _duration,
            curve: _curve,
          );
          return false;
        }
        return true;
      },
      child: GestureDetector(
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
                      content: 'عذرا،\n هذا الحساب محظور',
                      title: Icon(
                        Icons.block_outlined,
                        color: Theme.of(context).colorScheme.primary,
                        size: 35.sp,
                      ),
                    ),
                  );
                  _pageController.animateTo(
                    0,
                    duration: _duration,
                    curve: _curve,
                  );
                  _bloc.reInitializeState();
                  _reInitControllers();
                }
                if (state.accessibilityStaysType ==
                    AccessibilityStaysType.isRejected) {
                  showDialog(
                    context: context,
                    builder: (_) => CustomDialog(
                      content: 'عذراً،\nلقد تم رفض طلب انضمامك',
                      title: Icon(
                        Icons.no_accounts,
                        color: Theme.of(context).colorScheme.primary,
                        size: 35.sp,
                      ),
                    ),
                  );
                  _pageController.animateTo(
                    0,
                    duration: _duration,
                    curve: _curve,
                  );
                  _bloc.reInitializeState();
                  _reInitControllers();
                }
                if (state.accessibilityStaysType ==
                    AccessibilityStaysType.notApproved) {
                  showDialog(
                    context: context,
                    builder: (_) => CustomDialog(
                      content: 'عذراً،\n طلب انضمامك قيد المراجعة حالياً',
                      title: Icon(
                        Icons.lock_clock,
                        color: Theme.of(context).colorScheme.primary,
                        size: 35.sp,
                      ),
                    ),
                  );
                  _pageController.animateTo(
                    0,
                    duration: _duration,
                    curve: _curve,
                  );
                  _bloc.reInitializeState();
                  _reInitControllers();
                }
                if (state.accessibilityStaysType ==
                    AccessibilityStaysType.notRegistered) {
                  // Navigator to next page;
                  _goToNextPage();
                }
              }
              if (state.isRegisterRequestSent) {
                showDialog(
                  context: context,
                  builder: (_) => CustomDialog(
                    content: 'تم إرسال الطلب بنجاح',
                    title: Icon(
                      Icons.done_outline_rounded,
                      color: Theme.of(context).colorScheme.primary,
                      size: 35.sp,
                    ),
                  ),
                );
                _pageController.animateTo(
                  0,
                  duration: _duration,
                  curve: _curve,
                );
                _bloc.reInitializeState();
                _reInitControllers();
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
                      top: 250.h,
                      child: KeyboardAvoider(
                        child: SizedBox(
                          height: 500.h,
                          width: 375.w,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 25.w,
                            ),
                            child: PageView(
                              controller: _pageController,
                              physics: const NeverScrollableScrollPhysics(),
                              reverse: true,
                              children: [
                                PhoneNumberPage(
                                  phoneNumberTextController:
                                      _phoneNumberTextController,
                                  onPressed: _sendCode,
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
                                  locationTextController:
                                      _locationTextController,
                                  birthDateTextController: _birthDateController,
                                  genderController: _setGender,
                                  onPressed: _goToNextPage,
                                  pickFile: _pickFile,
                                ),
                                OrderSettingsPage(
                                  setDeliveryEndsAt: _setDeliveryEndsAt,
                                  setDeliveryStartsAt: _setDeliveryStartsAt,
                                  onPressed: _goToNextPage,
                                  deliveryStartsAt: _deliveryStartsAt,
                                  deliveryEndsAt: _deliveryEndsAt,
                                  maxMealsTextController:
                                      _maxMealsTextController,
                                ),
                                CertificateAndPicturePage(
                                  pickProfilePicture: _pickProfilePicture,
                                  profilePicture: state.profilePictureFile,
                                  pickFile: _pickFile,
                                  onPressed: _requestRegister,
                                  certificateFile: state.filePickerResult,
                                ),
                              ],
                            ),
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
      ),
    );
  }
}
