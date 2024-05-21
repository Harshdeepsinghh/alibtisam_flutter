import 'package:alibtisam_flutter/features/bottomNav/controller/user.dart';
import 'package:alibtisam_flutter/features/bottomNav/presentation/userDashboard/presentation/statistics/player_statistics.dart';
import 'package:alibtisam_flutter/features/bottomNav/presentation/userDashboard/presentation/statistics/coach/coach_teams_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticsNavigation extends StatefulWidget {
  const StatisticsNavigation({super.key});

  @override
  State<StatisticsNavigation> createState() => _StatisticsNavigationState();
}

class _StatisticsNavigationState extends State<StatisticsNavigation> {
  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return userController.user.role == "INTERNAL USER"
        ? PlayerStatistics()
        : CoachTeamsList();
  }
}
