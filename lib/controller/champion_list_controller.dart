import 'package:get/state_manager.dart';
import 'package:initial_app/repository/i_champions_repository.dart';

class ChampionListController extends GetxController with StateMixin {
  final IChampionsRepository _httpRepository;
  List<dynamic> championName = [].obs;
  List<dynamic> skins = [].obs;

  ChampionListController(
    this._httpRepository,
  );
  @override
  void onInit() {
    // Wen the controller started
    super.onInit();
    findChampions();
  }

  void findChampions() async {
    // Show the loading indicator
    change([], status: RxStatus.loading());
    // Try to get the data when the app start
    try {
      final resp = await _httpRepository.listAllChampions();
      // If the data is correct populate the controller and show the success
      change(resp, status: RxStatus.success());
    } catch (e) {
      // If the data is incorrect show the error
      change([], status: RxStatus.error('Error'));
    }

    
  }
  
  
}
