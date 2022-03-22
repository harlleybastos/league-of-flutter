import 'package:get/get.dart';

class ConditionalLoginController extends GetxController with StateMixin {
  String response = '';
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void setResponse(String response) {
    this.response = response;
    update();
  }
}
