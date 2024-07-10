import 'package:alibtisam/core/utils/loading_manager.dart';
import 'package:alibtisam/features/bottomNav/controller/attendance.dart';
import 'package:alibtisam/features/bottomNav/controller/user.dart';
import 'package:alibtisam/features/bottomNav/model/age_category.dart';
import 'package:alibtisam/features/bottomNav/presentation/userDashboard/presentation/attendance/coach/presentation/attendance_single_history.dart';
import 'package:alibtisam/core/common/widgets/custom_container_button.dart';
import 'package:alibtisam/core/common/widgets/custom_loading.dart';
import 'package:alibtisam/core/utils/custom_date_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceHistoryList extends StatefulWidget {
  const AttendanceHistoryList({super.key});

  @override
  State<AttendanceHistoryList> createState() => _AttendanceHistoryListState();
}

class _AttendanceHistoryListState extends State<AttendanceHistoryList> {
  final AttendanceController attendanceController =
      Get.find<AttendanceController>();
  @override
  void initState() {
    super.initState();
    if (userController.user!.stage != 'SCHOOL-AND-ACADEMY') {
      attendanceController.currentStage = userController.user!.stage;
    } else {
      attendanceController.currentStage = 'SCHOOL';
    }
    attendanceController.fetchAttendanceHistoryListByCoach();
  }

  final userController = Get.find<UserController>();

  bool schoolVal = true;
  bool academyVal = false;
  @override
  Widget build(BuildContext context) {
    return CustomLoader(
        child: Scaffold(
            appBar: AppBar(
              title: Text("attendanceHistory".tr),
            ),
            body: SingleChildScrollView(
              child: GetBuilder(
                  builder: (AttendanceController attendanceController) {
                return Column(
                  children: [
                    if (userController.user!.stage == 'SCHOOL-AND-ACADEMY')
                      Row(
                        children: [
                          CupertinoCheckbox(
                              value: schoolVal,
                              onChanged: (val) {
                                setState(() {
                                  academyVal = false;
                                  schoolVal = true;
                                  attendanceController.currentStage = 'SCHOOL';
                                  attendanceController.clearAttendanceId();
                                  attendanceController
                                      .fetchAttendanceHistoryListByCoach();
                                });
                              }),
                          Text('School'),
                          SizedBox(width: 20),
                          CupertinoCheckbox(
                              value: academyVal,
                              onChanged: (val) {
                                setState(() {
                                  academyVal = !false;
                                  schoolVal = !true;
                                  attendanceController.currentStage = 'ACADEMY';
                                  attendanceController.clearAttendanceId();
                                  attendanceController
                                      .fetchAttendanceHistoryListByCoach();
                                });
                              }),
                          Text('Academy'),
                        ],
                      ),
                    ...List.generate(
                        attendanceController.attendancesHistory.length,
                        (int index) {
                      AgeCategoryModel ageCategory = attendanceController
                          .attendancesHistory[index].ageCategoryId!;
                      return GestureDetector(
                        onTap: () {
                          attendanceController.attendanceId =
                              attendanceController.attendancesHistory[index].id;
                          Get.to(() => AttendanceSingleHistory());
                        },
                        child: CustomContainerButton(
                            flexibleHeight: 100,
                            label:
                                "${ageCategory.name} \n ${customDateTimeFormat(attendanceController.attendancesHistory[index].createdAt)}"
                                    .capitalize!),
                      );
                    })
                  ],
                );
              }),
            )));
  }
}
