import 'package:get/get.dart';

import '../controller/home_page_controller.dart';

import '../repository/i_home_section_repository.dart';

import '../service/home_section_repository.dart';

class HomeSectionBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<IHomeSectionRepository>(HomeSectionRepository(),
        tag: 'home_section_repository');
    Get.put(HomePageController(Get.find(tag: 'home_section_repository')),
        tag: 'homePageController');
  }
}
