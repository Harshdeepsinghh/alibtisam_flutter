import 'package:alibtisam/features/bottomNav/presentation/userDashboard/presentation/statistics/model/monitoring.dart';
import 'package:alibtisam/core/services/api_requests.dart';
import 'package:get/get.dart';

class ReportsController extends GetxController {
  List<MonitoringModel?> reports = [];

  fetchReports() async {
    reports = await ApiRequests().getReportsByPlayerId();
    update();
  }
}
