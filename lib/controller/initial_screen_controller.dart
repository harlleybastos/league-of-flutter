import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:initial_app/repository/i_initial_screen.dart';

class InitialScreenController extends GetxController with StateMixin<String> {
  final IInitialScreenRepository _initialScreenRepository;
  final GetStorage _getStorage = GetStorage();
  Map<String, String> data = {
    'version': '',
    'language': '',
  };

  InitialScreenController(this._initialScreenRepository);

  @override
  void onInit() {
    loadVersion();
    super.onInit();
  }

  Future loadVersion() async {
    change('', status: RxStatus.loading());
    try {
      final response = await _initialScreenRepository.getLatestVersionOfApi();
      change(response, status: RxStatus.success());
    } catch (e) {
      change('', status: RxStatus.error('Error'));
    }
  }

  void saveValues(String version, String language) {
    _getStorage.write('version', version);
    _getStorage.write('language', language);
  }
}
