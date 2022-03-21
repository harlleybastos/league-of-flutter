import 'package:flutter/cupertino.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:initial_app/controller/dashboard_page_controller.dart';
import 'package:initial_app/controller/home_page_controller.dart';
import 'package:initial_app/models/champion.dart';
import 'package:initial_app/repository/i_champions_repository.dart';

class ChampionListController extends GetxController
    with StateMixin<List<Champion>> {
  final IChampionsRepository _httpRepository;

  List<Champion> searchResult = [];
  List<Champion> championsList = [];
  List<dynamic> championName = [].obs;
  List<dynamic> skins = [].obs;

  TextEditingController textController = TextEditingController();

  bool userIsTipyng = false;

  final FocusNode focusNode = FocusNode();
  final KeyboardVisibilityController keyboardController =
      KeyboardVisibilityController();
  final GetStorage _getStorage = GetStorage();

  String language = '';
  String apiVersion = '';

  ChampionListController(
    this._httpRepository,
  );
  @override
  void onInit() {
    // Wen the controller started
    language = _getStorage.read('data')['language'];
    apiVersion = _getStorage.read('data')['version'];
    super.onInit();
    // findChampions();

    if (language.isNotEmpty && apiVersion.isNotEmpty) {
      findChampions(apiVersion, language);
    }

    if (focusNode.hasFocus) {
      focusNode.dispose();
    }
  }

  void updateFocus() {
    focusNode.requestFocus();
  }

  void findChampions(String version, String language) async {
    // Show the loading indicator
    change([], status: RxStatus.loading());
    // Try to get the data when the app start
    try {
      final resp = await _httpRepository.listAllChampions(version, language);
      championsList.addAll(resp);
      // the data is correct populate the controller and show the success
      change(championsList, status: RxStatus.success());
      // change(championsList, status: RxStatus.success());
    } catch (e) {
      // If the data is incorrect show the error
      change([], status: RxStatus.error('Error'));
    }
  }

  void filterListOfChampionsByName(String name) async {
    searchResult.clear();
    change([], status: RxStatus.loading());
    if (name.isEmpty && textController.value.text.isEmpty) {
      change(championsList, status: RxStatus.success());
      return;
    }
    for (var champion in championsList) {
      if (champion.name.toString().toLowerCase().contains(name.toLowerCase())) {
        searchResult.add(champion);
      }
    }
    if (searchResult.isEmpty) {
      change([], status: RxStatus.error('No champions found !'));
    } else {
      change(searchResult, status: RxStatus.success());
    }
  }
}
