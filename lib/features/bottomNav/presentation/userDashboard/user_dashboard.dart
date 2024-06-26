import 'package:SNP/features/bottomNav/controller/dashboard.dart';
import 'package:SNP/features/bottomNav/controller/user.dart';
import 'package:SNP/features/bottomNav/model/dashboard.dart';
import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/events/controller/event_navigation.dart';
import 'package:SNP/core/common/widgets/custom_dashboard_card.dart';
import 'package:SNP/core/common/widgets/custom_loading.dart';
import 'package:SNP/core/theme/app_colors.dart';
import 'package:SNP/network/api_requests.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  final eventNavigationController = Get.find<EventNavigation>();
  final userController = Get.find<UserController>();
  final dashboardController = Get.find<DashboardController>();

  @override
  void initState() {
    super.initState();
    userController.fetchUser();
    dashboardController.fetchDashboardItems();
  }

  @override
  Widget build(BuildContext context) {
    return CustomLoader(
      child: Scaffold(
        body: RefreshIndicator(
          color: primaryColor(),
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          onRefresh: () async {
            dashboardController.fetchDashboardItems();
          },
          child: SingleChildScrollView(
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  GetBuilder(
                    init: DashboardController(),
                    builder: (controller) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.dashboard.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          DashboardModel dashboard =
                              controller.dashboard[index];
                          return GestureDetector(
                            onTap: () {
                              if (dashboard.name == "Events") {
                                eventNavigationController
                                    .navigatingFromSplash(false);
                              }
                              Get.toNamed(dashboard.route)!.then((_) {
                                userController.fetchUser();
                                dashboardController.fetchDashboardItems();
                              });
                            },
                            child: CustomDashboardCard(
                              label: dashboard.name,
                              icon: dashboard.icon,
                            ),
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(height: 250),
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
