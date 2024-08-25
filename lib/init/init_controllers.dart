import 'package:alibtisam/features/auth/controller/otp_resend_count.dart';
import 'package:alibtisam/features/auth/viewmodel/sign_up_viewmodel.dart';
import 'package:alibtisam/features/bottomNav/controller/attendance.dart';
import 'package:alibtisam/features/bottomNav/controller/chat_messages.dart';
import 'package:alibtisam/features/bottomNav/controller/chats_list.dart';
import 'package:alibtisam/features/bottomNav/controller/dashboard.dart';
import 'package:alibtisam/features/bottomNav/controller/date_range.dart';
import 'package:alibtisam/features/bottomNav/controller/games.dart';
import 'package:alibtisam/features/bottomNav/controller/groups_controller.dart';
import 'package:alibtisam/features/bottomNav/controller/measurement_req.dart';
import 'package:alibtisam/features/bottomNav/controller/selected_player.dart';
import 'package:alibtisam/features/bottomNav/controller/teams.dart';
import 'package:alibtisam/features/bottomNav/controller/user.dart';
import 'package:alibtisam/features/bottomNav/presentation/settings/controller/change_password_viewmodel.dart';
import 'package:alibtisam/features/bottomNav/presentation/settings/controller/organization.dart';
import 'package:alibtisam/features/bottomNav/presentation/userDashboard/presentation/events/controller/active_player.dart';
import 'package:alibtisam/features/bottomNav/presentation/userDashboard/presentation/playerPolarization/controller/fetch_players.dart';
import 'package:alibtisam/features/bottomNav/presentation/userDashboard/presentation/statistics/controller/monitoring.dart';
import 'package:alibtisam/features/bottomNav/presentation/userDashboard/presentation/statistics/controller/reports.dart';
import 'package:alibtisam/core/theme/controller/theme_controller.dart';
import 'package:alibtisam/core/common/controller/custom_loading_controller.dart';
import 'package:alibtisam/features/bottomNav/presentation/userDashboard/presentation/events/controller/event_navigation.dart';
import 'package:alibtisam/features/bottomNav/presentation/userDashboard/presentation/store/viewmodel/category_viewmodel.dart';
import 'package:alibtisam/features/bottomNav/presentation/userDashboard/presentation/store/viewmodel/products_viewmodel.dart';
import 'package:alibtisam/features/bottomNav/presentation/userDashboard/presentation/tournamentRequest/viewmodel/tournament_request_viewmodel.dart';
import 'package:alibtisam/features/bottomNav/presentation/userDashboard/presentation/trainingPlan/viewModel/training_plan_viewmodel.dart';
import 'package:get/get.dart';

initControllers() {
  Get.put(ActivePlayerController());
  Get.put(EventNavigation());
  Get.put(CustomLoadingController());
  Get.put(ThemeController());
  Get.put(UserController());
  Get.put(DashboardController());
  Get.put(MeasurementReqController());
  Get.put(ChatMessagesController());
  Get.put(ChatsListController());
  Get.put(MonitoringController());
  Get.put(OrganizationController());
  Get.put(GamesController());
  Get.put(ReportsController());
  Get.put(TeamsController());
  Get.put(SelectedPlayerController());
  Get.put(AttendanceController());
  Get.put(DateRangeController());
  Get.put(GroupsController());
  Get.put(OtpResendCountController());
  Get.put(PlayerPolarizationController());
  Get.put(SignUpViewmodel());
  Get.put(TournamentRequestViewmodel());
  Get.put(ChangePasswordViewmodel());
  Get.put(CategoryViewmodel());
  Get.put(ProductsViewmodel());
  Get.put(TrainingPlanViewmodel());
}
