import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/measurementRequest/presentation/history/measurement_history.dart';
import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/measurementRequest/presentation/request/measurement_request.dart';
import 'package:SNP/core/common/widgets/custom_loading.dart';
import 'package:SNP/core/common/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeasurementTabBar extends StatefulWidget {
  const MeasurementTabBar({super.key});

  @override
  State<MeasurementTabBar> createState() => _MeasurementTabBarState();
}

class _MeasurementTabBarState extends State<MeasurementTabBar>
    with TickerProviderStateMixin {
  initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return CustomLoader(
      child: Scaffold(
        appBar: AppBar(
          title: Text("measurementRequest".tr),
        ),
        body: CustomTabBar(
          tabController: _tabController,
          customTabs: [
            Tab(
              text: "request".tr,
            ),
            Tab(
              text: "history".tr,
            ),
          ],
          tabViewScreens: [MeasurementRequest(), MeasurementHistory()],
        ),
      ),
    );
  }
}
