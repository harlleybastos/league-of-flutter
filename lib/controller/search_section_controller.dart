import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:initial_app/models/summoner.dart';
import 'package:initial_app/repository/i_search_summoner_repository.dart';

class SearchSectionController extends GetxController
    with StateMixin<List<Summoner>> {
  final FocusNode focusNode = FocusNode();
  final ISearchSummonerRepository finalSummonerRepository;
  final TextEditingController textController = TextEditingController();

  SearchSectionController(this.finalSummonerRepository);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void findSummoner() async {
    change([], status: RxStatus.loading());
    try {
      if (textController.text.length > 3) {
        List<Summoner> response = await finalSummonerRepository
            .getSummonerByName(textController.text);
        change(response, status: RxStatus.success());
      }
    } catch (error) {
      change([], status: RxStatus.error());
    }
  }
}
