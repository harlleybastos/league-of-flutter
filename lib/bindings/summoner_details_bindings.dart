import 'package:get/get.dart';

import '../controller/summoner_details_controller.dart';

class SummonerDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SummonerDetailsController());
  }
}
