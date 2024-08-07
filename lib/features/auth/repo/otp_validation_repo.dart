import 'dart:convert';

import 'package:alibtisam/core/utils/custom_snackbar.dart';
import 'package:alibtisam/core/services/api_requests.dart';
import 'package:alibtisam/core/services/api_urls.dart';
import 'package:alibtisam/core/services/http_wrapper.dart';
import 'package:alibtisam/core/services/org_id.dart';
import 'package:alibtisam/features/auth/view/screens/update_password.dart';
import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';

import 'package:logger/logger.dart';

class OtpValidationRepo {
  static void sendOTP(String phoneNumber) async {
    await HttpWrapper.postRequest(
      base_url + 'user/send-otp',
      {"to": phoneNumber},
    );
  }

  static Future<void> validateOTP({
    required String otp,
    required String email,
    required String password,
    required String mobile,
    required String name,
  }) async {
    final res = await HttpWrapper.postRequest(
      base_url + 'user/verify-otp',
      {
        "to": mobile,
        "code": otp,
      },
    );
    final data = jsonDecode(res.body);
    if (res.statusCode == 200) {
      await ApiRequests().register(
          email: email,
          password: password,
          clubId: orgId,
          mobile: mobile,
          name: name);
    } else {
      customSnackbar(message: data['message']);
    }

    // User is signed in, you can access user information here
  }

  static Future<void> validateOTPForgotPassword({
    required String otp,
    required String mobile,
  }) async {
    final res = await HttpWrapper.postRequest(
      base_url + 'user/verify-otp',
      {
        "to": mobile,
        "code": otp,
      },
    );
    final data = jsonDecode(res.body);
    if (res.statusCode == 200) {
      Get.to(() => UpdatePasswordScreen(
            username: mobile,
          ));
    } else {
      customSnackbar(message: data['message']);
    }

    // User is signed in, you can access user information here
  }
}
