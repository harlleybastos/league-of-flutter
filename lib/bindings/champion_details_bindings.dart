import 'package:get/get.dart';
import 'package:initial_app/controller/champion_details_controller.dart';
import 'package:initial_app/repository/i_champion_details_repository.dart';
import 'package:initial_app/service/champion_details_repository.dart';

class ChampionDetailsBindings implements Bindings{
  @override
  void dependencies() {
    Get.put<IChampionDetailsRepository>(ChampionDetailsRepository());
    Get.put(ChampionDetailsController(Get.find()));
  }

}