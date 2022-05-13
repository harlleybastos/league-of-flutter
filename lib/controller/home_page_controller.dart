import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:initial_app/controller/champion_list_controller.dart';
import 'package:initial_app/models/champion.dart';
import 'package:initial_app/models/summoner_match.dart';
import 'package:initial_app/service/home_section_repository.dart';

class HomePageController extends GetxController with StateMixin {
  Map<String, dynamic> summonerData = {};
  List<SummonerMatch> data = [];
  final HomeSectionRepository _homeSectionRepository;
  String mainChampion = '';
  final GetStorage _getStorage = GetStorage();
  final ChampionListController championListRepository;

  HomePageController(this._homeSectionRepository, this.championListRepository);

  @override
  void onInit() {
    summonerData = _getStorage.read('summonerData') ?? {};

    checkIfSummonerExisits();

    super.onInit();
  }

  Future<List<dynamic>> checkIfSummonerExisits() async {
    try {
      final response = await _homeSectionRepository.getDetailsOfSummoner(
          summonerData['puuid'], summonerData['id']);
      if (response.isNotEmpty) {
        data = response[0].matchHistory;
        mainChampion = await findMainChampion(response[0].championId);
        update();
      }
      return response;
    } catch (e) {
      return [];
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
