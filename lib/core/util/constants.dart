import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../features/auth/data/models/request_register_model.dart';

class Endpoints {
  static const baseUrl = "https://80cb-31-9-157-236.ngrok.io/api/chef";
  static const sendCode = "/send-code";
  static const checkCodeAndAccessibility = "/check-code-and-accessibility";
  static const requestRegister = "/request-register";
}

class SharedPreferencesKeys {
  static String apiToken = 'token';
}

class ErrorMessage {
  static String someThingWentWrong = 'حدث خطأ ما';
}

final option = Options(
  headers: {
    'Accept': 'application/json',
  },
);

final baseOptions = BaseOptions(
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  },
);

class RequestBody {
  // Send Code
  static FormData sendCode({required String phoneNumber}) {
    return FormData.fromMap({
      'phone_number': phoneNumber,
    });
  }

  // Check Code
  static FormData checkCode({
    required String phoneNumber,
    required String code,
  }) {
    return FormData.fromMap({
      'phone_number': phoneNumber,
      'code': code,
    });
  }

  // Request Register
  static FormData requestRegister({
    required RegisterRequestModel request,
  }) {
    if (request.certificatePath != null) {
      return FormData.fromMap({
        'phone_number': request.phoneNumber,
        'birth_date': request.birthDate,
        'name': request.name,
        'email': request.email,
        'location': request.location,
        'gender': request.gender.index,
        'latitude': request.latitude,
        'longitude': request.longitude,
        'delivery_starts_at': request.deliveryStartsAt,
        'delivery_ends_at': request.deliveryEndsAt,
        'max_meals_per_day': request.maxMealsPerDay,
        // 'profile_picture': request.profilePicture,
        'certificate': MultipartFile.fromFile(request.certificatePath!,
            filename: request.certificateName),
      });
    } else {
      return FormData.fromMap({
        'phone_number': request.phoneNumber,
        'birth_date': request.birthDate,
        'name': request.name,
        'email': request.email,
        'location': request.location,
        'gender': request.gender.index,
        'latitude': request.latitude,
        'longitude': request.longitude,
        'delivery_starts_at': request.deliveryStartsAt,
        'delivery_ends_at': request.deliveryEndsAt,
        'max_meals_per_day': request.maxMealsPerDay,
        // 'profile_picture': request.profilePicture,
      });
    }
  }
}

class GetOptions {
  static Options options = Options();

  static Options getOptionsWithToken(String? token, {int isPagination = 0}) {
    if (token != null && token.isNotEmpty) {
      options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': ' Bearer $token',
      };
    } else {
      options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
    }
    return options;
  }
}

void message({
  required String message,
  required bool isError,
  required BuildContext context,
  required bloc,
}) {
  // For debug only
  debugPrint('Message is "$message"');
  debugPrint(bloc.state.toString());

  if (message.isNotEmpty) {
    if (isError) {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red.withOpacity(1.0),
        textColor: Colors.white,
        fontSize: 16.0.sp,
      );
    } else {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        textColor: Colors.white,
        fontSize: 16.0.sp,
      );
    }
    bloc.clearMessage();
  }
}
