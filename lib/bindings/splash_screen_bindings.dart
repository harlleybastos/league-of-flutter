import 'package:get/get.dart';
import 'package:initial_app/controller/initial_screen_controller.dart';
import 'package:initial_app/repository/i_initial_screen.dart';
import 'package:initial_app/service/initial_screen_repository.dart';

class SplashScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<IInitialScreenRepository>(InitialScreenRepository(),
        tag: 'initial_screen_repository');
    Get.put(
        InitialScreenController(Get.find(tag: 'initial_screen_repository')));
  }
}
