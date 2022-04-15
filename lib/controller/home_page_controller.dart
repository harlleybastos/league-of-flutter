import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:initial_app/service/home_section_repository.dart';

class HomePageController extends GetxController with StateMixin {
  Map<String, dynamic> summonerData = {};
  final HomeSectionRepository _homeSectionRepository;
  final GetStorage _getStorage = GetStorage();

  HomePageController(this._homeSectionRepository);

  @override
  void onInit() {
    summonerData = _getStorage.read('summonerData');
    checkIfSummonerExisits();

    super.onInit();
  }

  Future<Map<String, dynamic>> checkIfSummonerExisits() async {
    try {
      final response = await _homeSectionRepository
          .getDetailsOfSummoner(summonerData['puuid']);
      print(response);
      return response;
    } catch (e) {
      return {};
    }
  }
}
