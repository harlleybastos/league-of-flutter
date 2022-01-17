import 'package:get/get.dart';
import '../controller/search_section_controller.dart';
import '../repository/i_search_summoner_repository.dart';
import '../service/search_summoner_repository.dart';

class SearchPageBindings implements Bindings{
  @override
  void dependencies() {
    Get.put<ISearchSummonerRepository>(SearchSummonerRepository());
    Get.put<SearchSectionController>(Get.find());
  }
}