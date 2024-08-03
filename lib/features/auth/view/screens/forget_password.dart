import 'package:alibtisam/core/common/widgets/custom_gradient_button.dart';
import 'package:alibtisam/core/common/widgets/custom_text_field.dart';
import 'package:alibtisam/features/auth/view/screens/update_password.dart';
import 'package:alibtisam/features/auth/view/widgets/logo_&_arabic_text.dart';
import 'package:alibtisam/features/auth/view/widgets/otp_pin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final otpController = TextEditingController();
  bool showOtpBox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Center(
                child: LogoAndArabicText(),
              ),
              SizedBox(height: 50),
              CustomTextField(label: 'Email or phone number'),
              SizedBox(height: 20),
              Visibility(
                  visible: showOtpBox,
                  child: OtpPinBox(controller: otpController)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {}, child: Text('Resend OTP'))
                ],
              ),
              SizedBox(height: 50),
              SizedBox(
                height: 70,
                child: CustomGradientButton(
                  label: showOtpBox ? 'Submit' : 'Continue',
                  onTap: () {
                    showOtpBox = true;
                    Get.to(() => UpdatePasswordScreen());
                    setState(() {});
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
