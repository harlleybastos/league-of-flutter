import 'package:get/get.dart';
import 'package:initial_app/controller/dashboard_page_controller.dart';

import '../controller/champion_list_controller.dart';

import '../repository/i_champions_repository.dart';

import '../service/champions_repository.dart';

class ChampionsListBindings implements Bindings {
  @override
  void dependencies() {
    // Runs before the app starts for populating the dependencies
    Get.put<IChampionsRepository>(ChampionsHttpRepository(),
        tag: 'champion_list', permanent: true);
    // Add the controller for execute the access for repository
    Get.put(DashboardPageController(),tag:'dashboard_page_controller');
    Get.put(ChampionListController(Get.find(tag: 'champion_list')));
  }
}
