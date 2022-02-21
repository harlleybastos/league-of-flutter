import 'package:get/get.dart';
import 'package:initial_app/controller/dashboard_page_controller.dart';
import '../controller/search_section_controller.dart';
import '../repository/i_search_summoner_repository.dart';
import '../service/search_summoner_repository.dart';

class SearchPageBindings implements Bindings{
  @override
  void dependencies() {
    Get.put<ISearchSummonerRepository>(SearchSummonerRepository());
    Get.put(DashboardPageController());
    Get.put<SearchSectionController>(Get.find());
  }
}