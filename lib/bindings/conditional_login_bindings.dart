import 'package:get/get.dart';

import '../controller/conditional_login_controller.dart';

import '../repository/i_conditional_login_repository.dart';

import '../service/conditional_login_repository.dart';

class ConditionalLoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IConditionalLoginRepository>(ConditionalLoginRepository(),
        tag: 'conditional_login_repository');
    Get.put(ConditionalLoginController(
        Get.find(tag: 'conditional_login_repository')));
  }
}
