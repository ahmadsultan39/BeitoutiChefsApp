import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Endpoints {
  static const BASE_URL = "";
}

class SharedPreferencesKeys {

}

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHE_FAILURE_MESSAGE = 'Cache Failure';


final OPTION = Options(
  headers: {
    'Accept': 'application/json',
  },
);

final BASE_OPTIONS = BaseOptions(
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  },
);

class RequestBody {
}

class GetOptions {
  static Options options = Options();

  static Options getOptionsWithToken(String? token,
      {int isPagination = 0}) {
    if (token != null && token.isNotEmpty) {
      options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'is-pagination': isPagination,
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


void error({
  required String errorMsg,
  context,
  bloc,
}) {
  debugPrint('Error message is "$errorMsg"');
  debugPrint(bloc.state.toString());
   if (errorMsg.isNotEmpty) {
    Fluttertoast.showToast(
      msg: errorMsg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      //Color.fromRGBO(255, 86, 31, 1),
      fontSize: 16.0,
    );
    bloc.clearError();
  }
}

