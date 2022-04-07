import 'package:get/get.dart';
import 'package:initial_app/controller/conditional_login_controller.dart';
import 'package:initial_app/repository/i_conditional_login_repository.dart';
import 'package:initial_app/service/conditional_login_repository.dart';

class ConditionalLoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IConditionalLoginRepository>(ConditionalLoginRepository(),
        tag: 'conditional_login_repository');
    Get.put(ConditionalLoginController(
        Get.find(tag: 'conditional_login_repository')));
  }
}
