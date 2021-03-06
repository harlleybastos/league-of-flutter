import 'package:get/get.dart';

import '../controller/champion_list_controller.dart';
import '../controller/dashboard_page_controller.dart';
import '../controller/search_section_controller.dart';

import '../repository/i_champions_repository.dart';
import '../repository/i_search_summoner_with_details.dart';
import '../repository/i_search_summoner_repository.dart';

import '../service/champions_repository.dart';
import '../service/search_summoner_with_details_repository.dart';
import '../service/search_summoner_repository.dart';

class SearchPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(DashboardPageController(), tag: 'dashboard_page_controller');

    Get.put<ISearchSummonerRepository>(SearchSummonerRepository(),
        tag: 'search_summoner_repository');

    Get.put<ISearchSummonerWithDetailsRepository>(
        SearchSummonerWithDetailsRepository(),
        tag: 'search_summoner_with_details_repository');

    Get.put<IChampionsRepository>(ChampionsHttpRepository(),
        tag: 'champion_list');

    Get.put(
        ChampionListController(Get.find(tag: 'champion_list')),
        tag: 'champion_list_controller');

    Get.put(SearchSectionController(
        Get.find(tag: 'search_summoner_repository'),
        Get.find(tag: 'search_summoner_with_details_repository'),
        Get.find(tag: 'champion_list_controller')));

    Get.put<SearchSectionController>(
        Get.find(tag: 'search_summoner_with_details_repository'));
  }
}
