import 'package:get/get.dart';

import '../controller/initial_screen_controller.dart';
import '../controller/home_page_controller.dart';
import '../controller/champion_list_controller.dart';
import '../controller/dashboard_page_controller.dart';
import '../controller/search_section_controller.dart';

import '../repository/i_initial_screen.dart';
import '../repository/i_champions_repository.dart';
import '../repository/i_search_summoner_repository.dart';
import '../repository/i_search_summoner_with_details.dart';

import '../service/initial_screen_repository.dart';
import '../service/champions_repository.dart';
import '../service/search_summoner_repository.dart';
import '../service/search_summoner_with_details_repository.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ISearchSummonerRepository>(SearchSummonerRepository(),
        tag: 'search_summoner_repository');

    Get.put<ISearchSummonerWithDetailsRepository>(
        SearchSummonerWithDetailsRepository(),
        tag: 'search_summoner_with_details_repository');

    Get.put<IChampionsRepository>(ChampionsHttpRepository(),
        tag: 'champion_list');

    Get.put<IInitialScreenRepository>(InitialScreenRepository(),
        tag: 'initial_screen_repository');

    Get.put<InitialScreenController>(
        InitialScreenController(Get.find(tag: 'initial_screen_repository')),
        tag: 'initial_screen_controller');

    Get.put(ChampionListController(Get.find(tag: 'champion_list')),
        tag: 'champion_list_controller');

    Get.put(SearchSectionController(
        Get.find(tag: 'search_summoner_repository'),
        Get.find(tag: 'search_summoner_with_details_repository'),
        Get.find(tag: 'champion_list_controller')));

    Get.put<DashboardPageController>(DashboardPageController());

    Get.put<IChampionsRepository>(ChampionsHttpRepository());

    Get.put(ChampionListController(Get.find()));

    Get.put(HomePageController());
  }
}
