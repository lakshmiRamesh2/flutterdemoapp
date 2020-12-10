import 'package:dio/src/response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_color.dart';
import 'package:toast/toast.dart';

class Utils {
  static const String FONT_FAMILY = "Nunito";

  static const String ERROR_NO_RESPONSE = "No response from server";
  static const String ERROR_NO_INTERNET = "Internet not connected";
  static const String ERROR_UNKNOWN = "Unknown error occurred";


  /// Header information
  static const String AUTHORIZATION = "Authorization";
  static const String AUTHORIZATION_TOKEN = "Basic bWNhY2FyZS1zZ3c6TWNhQ2FyZUAyMDIw";
  static const String X_MESSAGE_ID = "X-Message-Id";
  static const String X_MESSAGE_ID_TOKEN = "22334";
  static const String CONTENT_TYPE = "Content-Type";
  static const String CONTENT_APPLICATION_JSON = "application/json";

  /// Helper channel to call native Android/iOS code
  static const platform = const MethodChannel('flutter.native/helper');

  /// Params
  static const String PARAM_STATE = "state";
  static const String PARAM_STATE_CODE = "stateCd";
  static const String PARAM_REQUEST = "request";
  static const String PARAM_MEMBER_SEC_TYPE_KEY = "mtdtType";
  static const String PARAM_MEMBER_SEC_TYPE_VALUE = "SECTION_TYPE";


  static const String PARAM_USERID="userId";
  static const String PARAM_PASSWORD="currPword";
  static const String PARAM_NEW_PASSWORD="newPword";



  static const String PARAM_ORGANIZATION_TYPE = "ORGTYPE";


  /// Constants
  static const String USER_TYPE_RAKYAT = "RKYT";
  static const String USER_TYPE_MEMBER = "MEMBR";
  static const String META_DATA_TYPE = "mtdtType";
  static const String ORGANIZATION_TYPE_GOVERNMENT = "GOV";

  /// Function to show the error toast message
  static void showErrorToast(
    String message,
    BuildContext context, {
    int duration = 1,
  }) {
    Toast.show(message, context, duration: duration);
  }

  /// Function to show the error toast message
  static void showToast(
    String message,
    BuildContext context, {
    int duration = 1,
  }) {
    Toast.show(message, context, duration: duration);
  }

  static void showProgressDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(child: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(4),
            ),
            height: 60,
            width: 60,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        ), onWillPop: () {
          return Future.value(false);
        });
      },
    );
  }

  /// Dismiss the keyboard
  static void dismissKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static getErrorFromDio(Response<dynamic> response) {
    if(response != null && response.data != null) {
      return response.data["message"];
    }
    return ERROR_UNKNOWN;
  }
}
