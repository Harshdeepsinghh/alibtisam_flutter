import 'package:SNP/features/bottomNav/controller/attendance.dart';
import 'package:SNP/features/bottomNav/model/attendance.dart';
import 'package:SNP/features/bottomNav/model/user.dart';
import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/attendance/coach/presentation/attendance_In_time.dart';
import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/attendance/coach/presentation/attendance_single_history.dart';
import 'package:SNP/core/common/widgets/custom_empty_icon.dart';
import 'package:SNP/core/common/widgets/custom_gradient_button.dart';
import 'package:SNP/core/common/widgets/custom_loading.dart';
import 'package:SNP/core/theme/app_colors.dart';
import 'package:SNP/core/utils/custom_date_formatter.dart';
import 'package:SNP/network/api_requests.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceOutTime extends StatefulWidget {
  const AttendanceOutTime({super.key});

  @override
  State<AttendanceOutTime> createState() => _AttendanceOutTimeState();
}

class _AttendanceOutTimeState extends State<AttendanceOutTime> {
  final AttendanceController attendanceController =
      Get.find<AttendanceController>();
  List<PlayersAttendance> playersAttendance = [];
  @override
  void initState() {
    super.initState();
    attendanceController.fetchAttendanceForOutTime();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (AttendanceController attendanceController) {
        return CustomLoader(
          child: Scaffold(
            body: attendanceController.attendance.length == 0
                ? CustomEmptyWidget()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: attendanceController.attendance.length,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8,
                                    mainAxisExtent: 340,
                                    maxCrossAxisExtent: 220),
                            itemBuilder: (context, index) {
                              UserModel player = attendanceController
                                  .attendance[index].playerId;
                              return GestureDetector(
                                onTap: () {
                                  if (playersAttendance.contains(
                                      PlayersAttendance(id: player.id))) {
                                    playersAttendance.remove(
                                        PlayersAttendance(id: player.id));
                                  } else {
                                    playersAttendance.add(PlayersAttendance(
                                        id: player.id,
                                        outTime: DateTime.now().toString()));
                                  }
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: kAppGreyColor(),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                attendanceController
                                                    .attendance[index]
                                                    .playerId
                                                    .pic,
                                                fit: BoxFit.cover,
                                                height: 220,
                                                width: double.infinity,
                                              ),
                                            ),
                                            if (playersAttendance.contains(
                                                PlayersAttendance(
                                                    id: player.id)))
                                              Positioned(
                                                top: 10,
                                                right: 10,
                                                child: CircleAvatar(
                                                    backgroundColor:
                                                        kAppGreyColor(),
                                                    child: Icon(
                                                      Icons.check,
                                                      color: Colors.green,
                                                    )),
                                              )
                                          ],
                                        ),
                                        Spacer(),
                                        Text(attendanceController
                                            .attendance[index]
                                            .playerId
                                            .name
                                            .capitalize!),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "PlayerId: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  letterSpacing: 0),
                                            ),
                                            Text(
                                              attendanceController
                                                  .attendance[index]
                                                  .playerId
                                                  .pId,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  letterSpacing: 0),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          attendanceController
                                              .attendance[index].remark,
                                          maxLines: 2,
                                          style:
                                              TextStyle(color: primaryColor()),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text("In Time: " +
                                            customTimeFormat(
                                                attendanceController
                                                    .attendance[index].inTime)),
                                        Text("Out Time: " +
                                            "${attendanceController.attendance[index].outTime == '' ? "" : customTimeFormat(attendanceController.attendance[index].outTime)}")
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
            bottomNavigationBar: Container(
                margin: EdgeInsets.all(10),
                height: 70,
                child: CustomGradientButton(
                  onTap: () async {
                    await ApiRequests().markAttendance(
                        attendanceId: attendanceController.attendanceId,
                        playersAttendance: playersAttendance);
                    attendanceController.fetchAttendanceForOutTime();
                  },
                  label: "Submit",
                  disabled: attendanceController.attendance.isEmpty,
                )),
          ),
        );
      },
    );
  }
}
