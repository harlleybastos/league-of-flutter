import 'package:get/get.dart';
import 'package:initial_app/controller/dashboard_page_controller.dart';
import 'package:initial_app/controller/home_page_controller.dart';
import 'package:initial_app/controller/search_section_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardPageController>(() => DashboardPageController());
    Get.lazyPut<HomePageController>(() => HomePageController());
    Get.lazyPut<SearchSectionController>(() => SearchSectionController());
  }
}