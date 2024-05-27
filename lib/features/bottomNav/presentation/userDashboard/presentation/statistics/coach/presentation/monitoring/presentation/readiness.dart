import 'package:alibtisam_flutter/features/bottomNav/controller/user.dart';
import 'package:alibtisam_flutter/features/bottomNav/presentation/userDashboard/presentation/statistics/controller/monitoring.dart';
import 'package:alibtisam_flutter/helper/common/widgets/custom_gradient_button.dart';
import 'package:alibtisam_flutter/helper/common/widgets/custom_loading.dart';
import 'package:alibtisam_flutter/helper/common/widgets/custom_slider.dart';
import 'package:alibtisam_flutter/helper/utils/loading_manager.dart';
import 'package:alibtisam_flutter/network/api_requests.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Readiness extends StatefulWidget {
  const Readiness({super.key});

  @override
  State<Readiness> createState() => _ReadinessState();
}

class _ReadinessState extends State<Readiness> {
  bool canUpdate = false;
  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return CustomLoader(child: GetBuilder(
      builder: (MonitoringController monitoringController) {
        return Scaffold(
            appBar: AppBar(
              title: Text('readiness'.tr),
              actions: userController.user!.role == "EXTERNAL USER"
                  ? [
                      GestureDetector(
                        onTap: () async {
                          LoadingManager.dummyLoading();
                          setState(() {
                            canUpdate = !canUpdate;
                          });
                          if (!canUpdate) {
                            monitoringController.fetchMonitoringData();
                          }
                        },
                        child: Text(
                          canUpdate ? "cancel".tr : "edit".tr,
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ),
                      SizedBox(width: 20),
                    ]
                  : [],
            ),
            body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    CustomSlider(
                      value:
                          monitoringController.monitoring!.readiness.hydration,
                      label: "hydration".tr,
                      canChange: canUpdate,
                      onChanged: (val) {
                        monitoringController.monitoring!.readiness.hydration =
                            val;
                        setState(() {});
                      },
                    ),
                    CustomSlider(
                      value: monitoringController.monitoring!.readiness.stress,
                      label: "stress".tr,
                      canChange: canUpdate,
                      onChanged: (val) {
                        monitoringController.monitoring!.readiness.stress = val;

                        setState(() {});
                      },
                    ),
                    CustomSlider(
                      value: monitoringController.monitoring!.readiness.sleep,
                      label: "sleep".tr,
                      canChange: canUpdate,
                      onChanged: (val) {
                        monitoringController.monitoring!.readiness.sleep = val;

                        setState(() {});
                      },
                    ),
                    CustomSlider(
                      value: monitoringController.monitoring!.readiness.overall,
                      label: "overall".tr,
                      canChange: canUpdate,
                      onChanged: (val) {
                        monitoringController.monitoring!.readiness.overall =
                            val;

                        setState(() {});
                      },
                    ),
                    CustomSlider(
                      value:
                          monitoringController.monitoring!.readiness.nutrition,
                      label: "nutrition".tr,
                      canChange: canUpdate,
                      onChanged: (val) {
                        monitoringController.monitoring!.readiness.nutrition =
                            val;

                        setState(() {});
                      },
                    ),
                    CustomSlider(
                      value: monitoringController.monitoring!.readiness.injury,
                      label: "injury".tr,
                      canChange: canUpdate,
                      onChanged: (val) {
                        monitoringController.monitoring!.readiness.injury = val;

                        setState(() {});
                      },
                    ),
                    Spacer(),
                    if (canUpdate)
                      SizedBox(
                          height: 60,
                          child: CustomGradientButton(
                              onTap: () async {
                                await ApiRequests().updateMonitoringByPlayerId({
                                  "readiness": {
                                    "hydration": monitoringController
                                        .monitoring!.readiness.hydration,
                                    "stress": monitoringController
                                        .monitoring!.readiness.stress,
                                    "sleep": monitoringController
                                        .monitoring!.readiness.sleep,
                                    "overall": monitoringController
                                        .monitoring!.readiness.overall,
                                    "nutrition": monitoringController
                                        .monitoring!.readiness.nutrition,
                                    "injury": monitoringController
                                        .monitoring!.readiness.injury
                                  },
                                });

                                monitoringController.fetchMonitoringData();
                                setState(() {
                                  canUpdate = false;
                                });
                              },
                              label: "save".tr)),
                    SizedBox(height: 20),
                  ],
                )));
      },
    ));
  }
}
