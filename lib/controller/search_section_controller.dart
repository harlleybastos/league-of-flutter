import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:initial_app/models/summoner.dart';
import 'package:initial_app/models/summoner_details.dart';
import 'package:initial_app/repository/i_search_summoner_repository.dart';
import 'package:initial_app/repository/i_search_summoner_with_details.dart';

class SearchSectionController extends GetxController
    with StateMixin<List<SummonerDetails>> {
  final FocusNode focusNode = FocusNode();
  final ISearchSummonerRepository finalSummonerRepository;
  final ISearchSummonerWithDetailsRepository finalSummonerWithDetailsRepository;

  final TextEditingController textController = TextEditingController();

  SearchSectionController(
      this.finalSummonerRepository, this.finalSummonerWithDetailsRepository);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    textController.clear();
    super.onClose();
  }

  void findSummoner() async {
    change([], status: RxStatus.loading());
    try {
      final summonerInformations =
          await finalSummonerRepository.getSummonerByName(textController.text);
      final summonerDetails = await finalSummonerWithDetailsRepository
          .getSummonerDetailsByName(summonerInformations[0].id);
      change(summonerDetails, status: RxStatus.success());
    } catch (error) {
      change([], status: RxStatus.error(error.toString()));
    }
  }
}
