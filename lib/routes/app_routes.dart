import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/chat/chat_navigation.dart';
import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/enrollment/enrollment_navigation.dart';
import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/events/presentation/events.dart';
import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/attendance/attendance_navigation.dart';
import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/collection/collection.dart';
import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/loanApplication/loan_application.dart';
import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/measurementRequest/measurement_tab_bar.dart';
import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/playerPolarization/player_polarization.dart';
import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/practice/practice.dart';
import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/requestPortal/request_portal_navigation.dart';
import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/sessionAppointment/session_appointment.dart';
import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/sports/sports_navigation.dart';
import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/statistics/coach/presentation/monitoring/coach_player_monitoring.dart';
import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/statistics/statistics_navigation.dart';
import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/store/store_navigation.dart';
import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/tournamentRequest/tournament_request.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? pages = [
  GetPage(name: '/allEvents', page: () => AllEvents()),
  GetPage(name: '/sports', page: () => SportsNavigation()),
  GetPage(name: '/statistics', page: () => StatisticsNavigation()),
  GetPage(name: '/attendance', page: () => AttendanceNavigation()),
  GetPage(name: '/practice', page: () => Practice()),
  GetPage(name: '/store', page: () => StoreNavigation()),
  GetPage(name: '/requestPortal', page: () => RequestPortalNavigation()),
  GetPage(name: '/sessionAppointment', page: () => SessionAppointment()),
  GetPage(name: '/loan', page: () => LoanApplication()),
  GetPage(name: '/enroll', page: () => EnrollmentNavigation()),
  GetPage(name: '/collection', page: () => CollectionScreen()),
  GetPage(name: '/measurementRequest', page: () => MeasurementTabBar()),
  GetPage(name: '/playerPolarization', page: () => PlayerPolarization()),
  GetPage(name: '/tournamentRequest', page: () => TournamentRequest()),
  GetPage(name: '/coachMonitering', page: () => CoachPlayerMonitering()),
  GetPage(name: '/chat', page: () => ChatNavigation()),
];
