import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DashboardPageController extends GetxController {
  int tabIndex = 0;
  String language = '';
  String apiVersion = '';
  String answer = '';
  final GetStorage _getStorage = GetStorage();
  Map<String, dynamic> summonerData = {};

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  @override
  void onInit() {
    // summonerData = _getStorage.read('summonerData');
    language = _getStorage.read('language');
    apiVersion = _getStorage.read('version');
    answer = _getStorage.read('answer');
    super.onInit();
  }
}
