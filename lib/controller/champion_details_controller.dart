import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

import '../repository/i_champion_details_repository.dart';

class ChampionDetailsController extends GetxController
    with StateMixin<Map<String, dynamic>> {
  String championName = '';
  int selectedIndex = 0;
  int championSkins = 0;
  final IChampionDetailsRepository _championDetailsRepository;
  ChampionDetailsController(this._championDetailsRepository);

  final GetStorage _getStorage = GetStorage();

  String language = '';
  String apiVersion = '';

  @override
  void onInit() {
    super.onInit();
    language = _getStorage.read('language');
    apiVersion = _getStorage.read('version');
    championName = Get.arguments['championName'];
    getChampionDetails();
    update();
  }

  void getChampionDetails() async {
    change({}, status: RxStatus.loading());
    try {
      final Map<String, dynamic> response = await _championDetailsRepository
          .getChampionDetails(championName, language, apiVersion);
      change(response, status: RxStatus.success());
    } catch (e) {
      change({}, status: RxStatus.error('Ocorreu um erro !'));
    }
  }

  void changeIndex(int index) {
    selectedIndex = index;
    update();
  }
}
