import 'package:get/get.dart';
import '../controller/champion_list_controller.dart';
import '../repository/i_champions_repository.dart';
import '../service/champions_repository.dart';

class ChampionsListBindings implements Bindings{
  @override
  void dependencies() {
    // Runs before the app starts for populating the dependencies
    Get.put<IChampionsRepository>(ChampionsHttpRepository());
    // Add the controller for execute the access for repository
    Get.put(ChampionListController(Get.find()));
  }

}