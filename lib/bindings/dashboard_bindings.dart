import 'package:get/get.dart';
import 'package:initial_app/controller/champion_list_controller.dart';
import 'package:initial_app/repository/i_champions_repository.dart';
import 'package:initial_app/service/champions_repository.dart';
import '../controller/dashboard_page_controller.dart';
import '../controller/home_page_controller.dart';
import '../controller/search_section_controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchSectionController>(() => SearchSectionController());
    Get.lazyPut<IChampionsRepository>(() => ChampionsHttpRepository());
    Get.lazyPut<DashboardPageController>(() => DashboardPageController());
    Get.put(ChampionListController(Get.find()));
  }
}
