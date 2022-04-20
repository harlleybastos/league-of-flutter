import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:initial_app/service/home_section_repository.dart';

class HomePageController extends GetxController with StateMixin {
  Map<String, dynamic> summonerData = {};
  List<String> data = [];
  final HomeSectionRepository _homeSectionRepository;
  final GetStorage _getStorage = GetStorage();

  HomePageController(this._homeSectionRepository);

  @override
  void onInit() {
    summonerData = _getStorage.read('summonerData');
    checkIfSummonerExisits();

    super.onInit();
  }

  Future<List<String>> checkIfSummonerExisits() async {
    try {
      final response = await _homeSectionRepository.getDetailsOfSummoner(
          summonerData['puuid'], summonerData['id']);
      if (response.isNotEmpty) {
        data = response;
        update();
      }
      return response;
    } catch (e) {
      return [];
    }
  }
}
