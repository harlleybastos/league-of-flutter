import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:league_of_flutter/controller/champion_list_controller.dart';
import 'package:league_of_flutter/models/champion.dart';
import 'package:league_of_flutter/models/summoner_match.dart';
import 'package:league_of_flutter/service/home_section_repository.dart';

class HomePageController extends GetxController with StateMixin<bool> {
  Map<String, dynamic> summonerData = {};
  List<SummonerMatch> data = [];
  final HomeSectionRepository _homeSectionRepository;
  String mainChampion = '';
  final GetStorage _getStorage = GetStorage();
  final ChampionListController championListRepository;

  HomePageController(this._homeSectionRepository, this.championListRepository);

  @override
  void onInit() {
    super.onInit();
    summonerData = _getStorage.read('summonerData');
    checkIfSummonerExisits();
  }

  void checkIfSummonerExisits() async {
    try {
      change(true, status: RxStatus.loading());
      final response = await _homeSectionRepository.getDetailsOfSummoner(
          summonerData['puuid'], summonerData['id']);
      data = response[0].matchHistory;
      mainChampion = await findMainChampion(response[0].championId);
      change(false, status: RxStatus.success());
    } catch (e) {
      change(false, status: RxStatus.error(e.toString()));
    }
  }

  Future<String> findMainChampion(int? championId) async {
    try {
      final List<Champion> listOfAllChampions =
          championListRepository.championsList;
      String championName = '';

      if (listOfAllChampions.isNotEmpty && championId != null) {
        for (var champion in listOfAllChampions) {
          if (int.parse(champion.key) == championId) {
            championName = champion.name.trim();
          }
        }
      }

      return "http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${championName}_0.jpg";
    } catch (error) {
      return error.toString();
    }
  }

  Participants filterChampionList(List<Participants>? participants) {
    for (var participant in participants!) {
      if (participant.summonerName == summonerData['name']) {
        return participant;
      }
    }
    return [] as Participants;
  }

  String changeTypeOfGameMode(String gameMode) {
    switch (gameMode) {
      case "CLASSIC":
        return "Ranked Solo/Duo";

      default:
        return gameMode;
    }
  }
}
