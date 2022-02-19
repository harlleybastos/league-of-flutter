import 'package:get/get.dart';
import 'package:initial_app/repository/i_champion_details_repository.dart';

class ChampionDetailsController extends GetxController with StateMixin<Map<String,dynamic>> {
  String championName = '';
  int selectedIndex = 0;
  int championSkins = 0;
  final IChampionDetailsRepository _championDetailsRepository;
  ChampionDetailsController(this._championDetailsRepository);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    championName = Get.arguments['championName'];
    getChampionDetails();
    update();
  }

  void getChampionDetails() async {
    change({}, status: RxStatus.loading());
    try {
      final Map<String,dynamic> response =
          await _championDetailsRepository.getChampionDetails(championName);
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