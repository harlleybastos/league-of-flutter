import 'package:get/get.dart';

import '../controller/initial_screen_controller.dart';

import '../repository/i_initial_screen.dart';

import '../service/initial_screen_repository.dart';

class InitialScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<IInitialScreenRepository>(InitialScreenRepository(),
        tag: 'initial_screen_repository');
    Get.put(
        InitialScreenController(Get.find(tag: 'initial_screen_repository')));
  }
}
