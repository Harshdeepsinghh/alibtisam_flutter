import 'package:alibtisam/features/bottomNav/controller/selected_player.dart';
import 'package:alibtisam/features/bottomNav/controller/user.dart';
import 'package:alibtisam/features/statistics/coach/stages_tab_bar.dart';
import 'package:alibtisam/features/statistics/player_statistics.dart';
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
  SelectedPlayerController selectedPlayerController =
      Get.find<SelectedPlayerController>();
  navigation() {
    if (userController.user!.role == "INTERNAL USER") {
      selectedPlayerController.updatePlayerId(userController.user!.id);
      return PlayerStatistics(
        playerId: userController.user!.id!,
      );
    } else {
      return StagesTabBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    return navigation();
  }
}
