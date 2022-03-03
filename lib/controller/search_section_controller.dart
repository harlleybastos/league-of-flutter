import 'package:flutter/cupertino.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:initial_app/controller/champion_list_controller.dart';
import 'package:initial_app/models/champion.dart';
import 'package:initial_app/models/summoner.dart';
import 'package:initial_app/models/summoner_details.dart';
import 'package:initial_app/repository/i_champions_repository.dart';
import 'package:initial_app/repository/i_search_summoner_repository.dart';
import 'package:initial_app/repository/i_search_summoner_with_details.dart';

class SearchSectionController extends GetxController
    with StateMixin<List<SummonerDetails>> {
  final FocusNode focusNode = FocusNode();
  final ISearchSummonerRepository finalSummonerRepository;
  final ISearchSummonerWithDetailsRepository finalSummonerWithDetailsRepository;
  final ChampionListController championListRepository;
  String summonerMainChampionSkin = '';
  Rx<bool> userIsTipyng = false.obs;

  final KeyboardVisibilityController keyboardController =
      KeyboardVisibilityController();

  var isKeyboardVisible = false.obs;

  final TextEditingController textController = TextEditingController();

  SearchSectionController(this.finalSummonerRepository,
      this.finalSummonerWithDetailsRepository, this.championListRepository);
  @override
  void onInit() {
    // TODO: implemnt onInit

    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady

    FocusManager.instance.addListener(() {
      if (FocusManager.instance.primaryFocus == null) {
        print("Ta fechado corno");
      }
      if (FocusManager.instance.primaryFocus != null) {
        print("Ta aberto corno");
      }
    });
    super.onReady();
  }

  void findSummoner() async {
    change([], status: RxStatus.loading());
    try {
      final summonerInformations =
          await finalSummonerRepository.getSummonerByName(textController.text);
      List<SummonerDetails> summonerDetails = [];
      final String mainChampion;
      if (summonerInformations[0].id.isNotEmpty) {
        summonerDetails = await finalSummonerWithDetailsRepository
            .getSummonerDetailsByName(summonerInformations[0].id);
        mainChampion = await findMainChampion(
            summonerDetails, summonerDetails[0].championId.toString());
        summonerMainChampionSkin = mainChampion;
        change(summonerDetails, status: RxStatus.success());
      }
      if (summonerDetails.isEmpty) {
        change(summonerDetails, status: RxStatus.error());
      }
    } catch (error) {
      change([], status: RxStatus.error(error.toString()));
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
      return "http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${championName}_0.jpg";
    } catch (error) {
      return error.toString();
    }
  }
}
