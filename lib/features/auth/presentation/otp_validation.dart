import 'package:alibtisam/core/common/widgets/custom_gradient_button.dart';
import 'package:alibtisam/core/utils/custom_snackbar.dart';
import 'package:alibtisam/features/auth/controller/otp_resend_count.dart';
import 'package:alibtisam/features/auth/widgets/logo_&_arabic_text.dart';
import 'package:alibtisam/features/auth/widgets/otp_pin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OtpValidation extends StatefulWidget {
  const OtpValidation({super.key});

  @override
  State<OtpValidation> createState() => _OtpValidationState();
}

class _OtpValidationState extends State<OtpValidation> {
  final otpController = Get.find<OtpResendCountController>();
  @override
  void initState() {
    super.initState();
    if (otpController.count.value == 0) {
      otpController.reset();
      customSnackbar(
          message: '6-digit OTP has been sent on your mobile number');
    }
    otpController.start();
  }

  @override
  void dispose() {
    otpController.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: LogoAndArabicText(),
              ),
              SizedBox(height: 60),
              OtpPinBox(),
              SizedBox(height: 20),
              Row(
                children: [
                  Spacer(),
                  Obx(
                    () => Visibility(
                        visible: otpController.count.value != 0,
                        child:
                            Text("00:" + otpController.count.value.toString())),
                  ),
                  TextButton(
                      onPressed: () {
                        print(otpController.count.value);
                        if (otpController.count.value == 0) {
                          otpController.reset();
                          otpController.start();
                          customSnackbar(
                              message:
                                  '6-digit OTP has been sent on your mobile number');
                        }
                      },
                      child: Text('Resend OTP'))
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 70,
                child: CustomGradientButton(
                    onTap: () async{
                    // await  FirebaseAuth.instance.signinWith(phoneNumber)
                    },
                    label: 'Validate OTP'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
