import 'package:get/get.dart';
import 'package:initial_app/bindings/dashboard_bindings.dart';
import 'package:initial_app/routes/app_routes.dart';
import 'package:initial_app/screens/dashboard_page.dart';

class AppPages {
  static var list  = [
    GetPage(
      name : AppRoutes.Dashboard,
      page: () => DashboardPage(),
      binding: DashboardBinding()
    ),
  ];
}