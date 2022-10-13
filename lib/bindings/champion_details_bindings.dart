import 'package:get/get.dart';
import 'package:initial_app/service/champion_details/champion_details_repository.dart';
import 'package:initial_app/shared/rest_client.dart';

import '../controller/champion_details_controller.dart';

import '../repository/i_champion_details_repository.dart';

class ChampionDetailsBindings implements Bindings {
  @override
  void dependencies() {
    // Get.put<IChampionDetailsRepository>(ChampionDetailsRepository(),
    //     tag: 'champion_details_repository');
    Get.lazyPut(() => ChampionDetailsRepository(
          RestClient(),
        ));
    Get.put<IChampionDetailsRepository>(
      ChampionDetailsRepository(
        RestClient(),
      ),
    );
    Get.put(ChampionDetailsController(Get.find()));
  }
}
