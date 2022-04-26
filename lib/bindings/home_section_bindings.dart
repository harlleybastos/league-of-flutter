import 'package:get/get.dart';

import '../controller/champion_list_controller.dart';
import '../controller/home_page_controller.dart';

import '../repository/i_champions_repository.dart';
import '../repository/i_home_section_repository.dart';

import '../service/champions_repository.dart';
import '../service/home_section_repository.dart';

class HomeSectionBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<IHomeSectionRepository>(HomeSectionRepository(),
        tag: 'home_section_repository');

    Get.put<IChampionsRepository>(ChampionsHttpRepository(),
        tag: 'champion_list');

    Get.put(ChampionListController(Get.find(tag: 'champion_list')),
        tag: 'champion_list_controller');

    Get.put(
        HomePageController(Get.find(tag: 'home_section_repository'),
            Get.find(tag: 'champion_list_controller')),
        tag: 'homePageController');
  }
}
