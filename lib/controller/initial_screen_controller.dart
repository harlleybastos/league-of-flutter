import 'package:get/get.dart';
import 'package:initial_app/repository/i_initial_screen.dart';

class InitialScreenController extends GetxController with StateMixin<String> {
  final IInitialScreenRepository _initialScreenRepository;

  InitialScreenController(this._initialScreenRepository);

  @override
  void onInit() {
    // TODO: implement onInit
    loadVersion();
    super.onInit();
  }

  Future loadVersion() async {
    change('', status: RxStatus.loading());
    try {
      final response = await _initialScreenRepository.getLatestVersionOfApi();
      change(response, status: RxStatus.success());
    } catch (e) {
      print(e);
      change('', status: RxStatus.error('Error'));
    }
  }
}
