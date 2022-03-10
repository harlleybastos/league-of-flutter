import 'package:flutter/cupertino.dart';

import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:get/get.dart';

import '../controller/champion_list_controller.dart';

import '../models/champion.dart';
import '../models/summoner.dart';
import '../models/summoner_details.dart';

import '../repository/i_search_summoner_repository.dart';
import '../repository/i_search_summoner_with_details.dart';

class SearchSectionController extends GetxController
    with StateMixin<List<SummonerDetails>> {
  final FocusNode focusNode = FocusNode();
  final ISearchSummonerRepository finalSummonerRepository;
  final ISearchSummonerWithDetailsRepository finalSummonerWithDetailsRepository;
  final ChampionListController championListRepository;
  String summonerMainChampionSkin = '';
  Rx<bool> userIsTipyng = false.obs;
  List<SummonerDetails> summonerDetails = [];
  List<Summoner> summonerInformations = [];
  bool errorInSearch = false;

  final KeyboardVisibilityController keyboardController =
      KeyboardVisibilityController();

  var isKeyboardVisible = false.obs;

  final TextEditingController textController = TextEditingController();

  SearchSectionController(this.finalSummonerRepository,
      this.finalSummonerWithDetailsRepository, this.championListRepository);
  @override
  void onInit() {
    change([], status: RxStatus.empty());
    super.onInit();
  }

  void clearSearched() {
    errorInSearch = false;
    summonerDetails = [];
    summonerInformations = [];
    textController.clear();
    change([], status: RxStatus.empty());
  }

  void findSummoner() async {
    change([], status: RxStatus.loading());
    try {
      summonerInformations =
          await finalSummonerRepository.getSummonerByName(textController.text);
      final String mainChampion;

      summonerDetails =
          await finalSummonerWithDetailsRepository.getSummonerDetailsByName(
              summonerInformations[0].id, summonerInformations[0].accountId);

      mainChampion = await findMainChampion(
          summonerDetails, summonerDetails[0].championId.toString());

      summonerMainChampionSkin = mainChampion;
      change(summonerDetails, status: RxStatus.success());
    } catch (error) {
      change([], status: RxStatus.error());
      errorInSearch = true;
    }
  }

  Future<String> findMainChampion(
      List<SummonerDetails> summonerDetails, String championId) async {
    try {
      final List<Champion> listOfAllChampions =
          championListRepository.championsList;
      String championName = '';

      if (listOfAllChampions.isNotEmpty && championId.isNotEmpty) {
        for (var champion in listOfAllChampions) {
          if (champion.key == championId) {
            championName = champion.name;
          }
        }
      }

      if (championName.contains(' ')) {
        championName = championName.replaceAll(' ', '');
      }
      return "http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${championName}_0.jpg";
    } catch (error) {
      return error.toString();
    }
  }
}
