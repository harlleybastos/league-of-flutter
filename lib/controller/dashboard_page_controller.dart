import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DashboardPageController extends GetxController {
  int tabIndex = 0;
  String language = '';
  String apiVersion = '';
  String answer = '';
  final GetStorage _getStorage = GetStorage();

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  @override
  void onInit() {
    language = _getStorage.read('data')['language'];
    apiVersion = _getStorage.read('data')['version'];
    answer = _getStorage.read('answer');
    super.onInit();
  }
}
