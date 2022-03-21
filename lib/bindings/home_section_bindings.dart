import 'package:get/get.dart';
import 'package:initial_app/controller/home_page_controller.dart';

class HomeSectionBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController(),
        tag: 'homePageController');
  }
}
