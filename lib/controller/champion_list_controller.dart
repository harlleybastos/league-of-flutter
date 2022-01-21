import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:initial_app/repository/i_champions_repository.dart';

class ChampionListController extends GetxController with StateMixin {
  final IChampionsRepository _httpRepository;
  List<dynamic> championName = [].obs;
  List<dynamic> skins = [].obs;
  final FocusNode focusNode = FocusNode();
  TextEditingController textController = TextEditingController();
  List<dynamic> searchResult = [];
  List<dynamic> championsList = [];

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
      championsList.addAll(resp);

      championsList.forEach((champion) {
        print(champion['name']);
      });
      // If the data is correct populate the controller and show the success
      change(championsList, status: RxStatus.success());
    } catch (e) {
      // If the data is incorrect show the error
      change([], status: RxStatus.error('Error'));
    }
  }

  void filterListOfChampionsByName(String name) async {
    searchResult.clear();
    if(name.isEmpty){
      return;
    }
    championsList.forEach((champion) {
      if(champion['name'].contains(name)){
        searchResult.add(champion);
      }
    });

  }
}
