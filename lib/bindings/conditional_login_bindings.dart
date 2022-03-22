import 'package:get/get.dart';
import 'package:initial_app/controller/conditional_login_controller.dart';

class ConditionalLoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ConditionalLoginController());
  }
}
