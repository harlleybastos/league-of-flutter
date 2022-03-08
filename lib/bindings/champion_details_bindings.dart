import 'package:get/get.dart';

import '../controller/champion_details_controller.dart';

import '../repository/i_champion_details_repository.dart';

import '../service/champion_details_repository.dart';

class ChampionDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<IChampionDetailsRepository>(ChampionDetailsRepository());
    Get.put(ChampionDetailsController(Get.find()));
  }
}
