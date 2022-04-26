import 'package:get/get.dart';

import '../controller/home_page_controller.dart';
import '../controller/dashboard_page_controller.dart';
import '../controller/champion_list_controller.dart';

import '../repository/i_home_section_repository.dart';
import '../repository/i_champions_repository.dart';

import '../service/home_section_repository.dart';
import '../service/champions_repository.dart';

class ChampionsListBindings implements Bindings {
  @override
  void dependencies() {
    // Runs before the app starts for populating the dependencies
    Get.put<IChampionsRepository>(ChampionsHttpRepository(),
        tag: 'champion_list');
    // Add the controller for execute the access for repository
    Get.put<IHomeSectionRepository>(HomeSectionRepository(),
        tag: 'home_section_repository');

    Get.put(ChampionListController(Get.find(tag: 'champion_list')),
        tag: 'champion_list_controller');

    Get.put(HomePageController(Get.find(tag: 'home_section_repository'),
        Get.find(tag: 'champion_list')));
    Get.put(DashboardPageController(), tag: 'dashboard_page_controller');
    Get.put(ChampionListController(Get.find(tag: 'champion_list')));
  }
}
