import 'package:alibtisam_flutter/features/bottomNav/controller/measurement_req.dart';
import 'package:alibtisam_flutter/features/bottomNav/model/user.dart';
import 'package:alibtisam_flutter/helper/common/widgets/custom_container_button.dart';
import 'package:alibtisam_flutter/helper/common/widgets/custom_loading.dart';
import 'package:alibtisam_flutter/helper/common/widgets/custom_text_field.dart';
import 'package:alibtisam_flutter/helper/utils/loading_manager.dart';
import 'package:alibtisam_flutter/network/api_requests.dart';
import 'package:alibtisam_flutter/network/api_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeasurementForm extends StatelessWidget {
  final UserModel user;
  final String requestId;
  const MeasurementForm(
      {super.key, required this.user, required this.requestId});

  @override
  Widget build(BuildContext context) {
    final heightController =
        TextEditingController(text: user.height.toString());
    final weightController =
        TextEditingController(text: user.weight.toString());
    final chestController = TextEditingController();
    final normalController = TextEditingController();
    final highJumpController = TextEditingController();
    final lowJumpController = TextEditingController();
    final heartBeatingRateController = TextEditingController();
    final pulseRateController = TextEditingController();
    final tShirtSizeController = TextEditingController();
    final waistSizeController = TextEditingController();
    final shoesSizeController = TextEditingController();

    final formKey = GlobalKey<FormState>();
    List tshirtSize = ['S', 'M', 'L'];
    return Form(
      key: formKey,
      child: CustomLoader(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Form"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CustomTextField(
                        digitsOnly: true,
                        keyboardType: TextInputType.number,
                        controller: heightController,
                        width: Get.width * 0.46,
                        label: "height ft"),
                    SizedBox(
                      width: 10,
                    ),
                    CustomTextField(
                        digitsOnly: true,
                        keyboardType: TextInputType.number,
                        controller: weightController,
                        width: Get.width * 0.46,
                        label: "weight kg")
                  ],
                ),
                Row(
                  children: [
                    CustomTextField(
                        digitsOnly: true,
                        keyboardType: TextInputType.number,
                        controller: chestController,
                        width: Get.width * 0.46,
                        label: "chest size"),
                    SizedBox(
                      width: 10,
                    ),
                    CustomTextField(
                        digitsOnly: true,
                        keyboardType: TextInputType.number,
                        controller: normalController,
                        width: Get.width * 0.46,
                        label: "normal chest size")
                  ],
                ),
                Row(
                  children: [
                    CustomTextField(
                        digitsOnly: true,
                        keyboardType: TextInputType.number,
                        controller: highJumpController,
                        width: Get.width * 0.46,
                        label: "high jump"),
                    SizedBox(
                      width: 10,
                    ),
                    CustomTextField(
                        digitsOnly: true,
                        keyboardType: TextInputType.number,
                        controller: lowJumpController,
                        width: Get.width * 0.46,
                        label: "low jump")
                  ],
                ),
                Row(
                  children: [
                    CustomTextField(
                        digitsOnly: true,
                        keyboardType: TextInputType.number,
                        controller: heartBeatingRateController,
                        width: Get.width * 0.46,
                        label: "heartBeatingRate"),
                    SizedBox(
                      width: 10,
                    ),
                    CustomTextField(
                        digitsOnly: true,
                        keyboardType: TextInputType.number,
                        controller: pulseRateController,
                        width: Get.width * 0.46,
                        label: "pulseRate")
                  ],
                ),
                Row(
                  children: [
                    CustomTextField(
                        readOnly: true,
                        suffix: DropdownButton(
                            items: tshirtSize
                                .map((e) =>
                                    DropdownMenuItem(value: e, child: Text(e)))
                                .toList(),
                            onChanged: (Object? val) {
                              tShirtSizeController.text = val.toString();
                            }),
                        digitsOnly: true,
                        keyboardType: TextInputType.number,
                        controller: tShirtSizeController,
                        width: Get.width * 0.46,
                        label: "tShirtSize"),
                    SizedBox(
                      width: 10,
                    ),
                    CustomTextField(
                        digitsOnly: true,
                        keyboardType: TextInputType.number,
                        controller: waistSizeController,
                        width: Get.width * 0.46,
                        label: "waistSize")
                  ],
                ),
                Row(
                  children: [
                    CustomTextField(
                        digitsOnly: true,
                        keyboardType: TextInputType.number,
                        controller: shoesSizeController,
                        width: Get.width * 0.46,
                        label: "shoeSize"),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Spacer(),
                CustomContainerButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        await ApiRequests().submitMeasurementRequest(
                            height: heightController.text,
                            weight: weightController.text,
                            chestSize: chestController.text,
                            normalChestSize: normalController.text,
                            highJump: highJumpController.text,
                            lowJump: lowJumpController.text,
                            heartBeatingRate: heartBeatingRateController.text,
                            pulseRate: pulseRateController.text,
                            tshirtSize: tShirtSizeController.text,
                            waistSize: waistSizeController.text,
                            shoeSize: shoesSizeController.text,
                            requestId: requestId);
                      }
                    },
                    label: "submit".tr),
                SizedBox(height: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
