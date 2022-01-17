import 'package:get/get.dart';
import '../controller/dashboard_page_controller.dart';
import '../controller/home_page_controller.dart';
import '../controller/search_section_controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardPageController>(() => DashboardPageController());
    Get.lazyPut<HomePageController>(() => HomePageController());
    Get.lazyPut<SearchSectionController>(() => SearchSectionController());
  }
}