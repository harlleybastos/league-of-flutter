import 'package:get/get.dart';
import 'package:initial_app/controller/champion_list_controller.dart';
import 'package:initial_app/repository/i_champions_repository.dart';
import 'package:initial_app/repository/i_search_summoner_repository.dart';
import 'package:initial_app/service/champions_repository.dart';
import 'package:initial_app/service/search_summoner_repository.dart';
import '../controller/dashboard_page_controller.dart';
import '../controller/home_page_controller.dart';
import '../controller/search_section_controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ISearchSummonerRepository>(SearchSummonerRepository());
    Get.put(SearchSectionController(Get.find()));
    Get.lazyPut<IChampionsRepository>(() => ChampionsHttpRepository());
    Get.lazyPut<DashboardPageController>(() => DashboardPageController());
    Get.put<IChampionsRepository>(ChampionsHttpRepository());
    // Add the controller for execute the access for repository
    Get.put(ChampionListController(Get.find()));
  }
}
