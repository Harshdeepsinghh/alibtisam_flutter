import 'package:alibtisam/features/bottomNav/controller/attendance.dart';
import 'package:alibtisam/features/attendance/models/attendance.dart';
import 'package:alibtisam/features/enrollment/models/user.dart';
import 'package:alibtisam/core/common/widgets/custom_empty_icon.dart';
import 'package:alibtisam/core/common/widgets/custom_loading.dart';
import 'package:alibtisam/core/utils/custom_date_formatter.dart';
import 'package:alibtisam/core/common/widgets/player_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceSingleHistory extends StatefulWidget {
  const AttendanceSingleHistory({super.key});

  @override
  State<AttendanceSingleHistory> createState() =>
      _AttendanceSingleHistoryState();
}

class _AttendanceSingleHistoryState extends State<AttendanceSingleHistory> {
  final AttendanceController attendanceController =
      Get.find<AttendanceController>();
  List<PlayersAttendance> playersAttendance = [];
  @override
  void initState() {
    super.initState();
    attendanceController.fetchSingleAttendanceById();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (AttendanceController attendanceController) {
        return  Scaffold(
            appBar: AppBar(
              toolbarHeight: 80,
              title: Text("history".tr),
            ),
            body: attendanceController.attendance.length == 0
                ? CustomEmptyWidget()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: attendanceController.attendance.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              UserModel player = attendanceController
                                  .attendance[index].playerId;
                              return PlayerCard(
                                name: player.name!,
                                image: player.pic!,
                                playerId: player.pId.toString(),
                                showArrow: false,
                                extraWidget: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'In Time :- ${customTimeFormat(attendanceController.attendance[index].inTime)}'),
                                    Text(
                                        'Out Time :- ${customTimeFormat(attendanceController.attendance[index].outTime)}'),
                                    SizedBox(
                                      child: Text(
                                        attendanceController
                                            .attendance[index].remark,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            letterSpacing: 0),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
          
        );
      },
    );
  }
}
