import 'package:flutter/cupertino.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/champion.dart';

import '../repository/i_champions_repository.dart';

class ChampionListController extends GetxController
    with StateMixin<List<Champion>> {
  final IChampionsRepository _championListRepository;

  List<Champion> searchResult = [];
  List<Champion> championsList = [];
  List<dynamic> championName = [].obs;
  List<dynamic> skins = [].obs;

  final TextEditingController textController = TextEditingController();

  bool userIsTipyng = false;
  bool pageIsLoaded = false;

  final FocusNode focusNode = FocusNode();
  final KeyboardVisibilityController keyboardController =
      KeyboardVisibilityController();
  final GetStorage _getStorage = GetStorage();

  String language = '';
  String apiVersion = '';

  ChampionListController(
    this._championListRepository,
  );
  @override
  void onInit() {
    // Wen the controller started
    language = _getStorage.read('language');
    apiVersion = _getStorage.read('version');
    super.onInit();
    if (language.isNotEmpty && apiVersion.isNotEmpty) {
      findChampions(apiVersion, language);
      _getStorage.write('champions', championsList);
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
      final resp =
          await _championListRepository.listAllChampions(version, language);
      championsList.addAll(resp);
      // the data is correct populate the controller and show the success

      change(championsList, status: RxStatus.success());
    } catch (e) {
      // If the data is incorrect show the error
      change([], status: RxStatus.error('Error'));
    } finally {
      pageIsLoaded = true;
      update();
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
