import 'package:alibtisam/features/auth/view/screens/login.dart';
import 'package:alibtisam/core/localStorage/token_id.dart';
import 'package:alibtisam/core/theme/app_colors.dart';
import 'package:alibtisam/core/services/api_requests.dart';
import 'package:alibtisam/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> kLogoutUser(BuildContext context) {
  final authViewmodel = Get.find<AuthViewmodel>();

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "areYouSureYouWantToLogOut".tr,
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "no".tr,
                  style: TextStyle(color: primaryColor()),
                )),
            ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: primaryColor()),
                onPressed: () async {
                  await authViewmodel.logout();
                  remove('token');
                  remove('uid');
                  Get.to(() => LoginScreen());
                },
                child: Obx(
                  () => authViewmodel.isLoading.value
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          "yes".tr,
                          style: TextStyle(color: Colors.white),
                        ),
                )),
          ],
        );
      });
}
