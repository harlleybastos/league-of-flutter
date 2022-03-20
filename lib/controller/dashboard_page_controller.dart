import 'package:get/get.dart';

class DashboardPageController extends GetxController {
  int tabIndex = 0;
  String language = '';
  String apiVersion = '';

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  @override
  void onInit() {
    language = Get.arguments['language'];
    apiVersion = Get.arguments['latestVersionOfApi'];
    super.onInit();
  }
}
