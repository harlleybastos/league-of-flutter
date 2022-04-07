import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:initial_app/repository/i_conditional_login_repository.dart';

class ConditionalLoginController extends GetxController with StateMixin {
  String response = '';
  bool isAnimatedEnded = false;
  bool isSummonerNameEmpty = false;
  String summonerName = '';
  final IConditionalLoginRepository _conditionalLoginRepository;
  final TextEditingController textEditingController = TextEditingController();
  final GetStorage _getStorage = GetStorage();

  ConditionalLoginController(this._conditionalLoginRepository);

  @override
  void onInit() {
    textEditingController.addListener(() {
      summonerName = textEditingController.text;
    });
    super.onInit();
  }

  void setResponse(String response) {
    this.response = response;
    update();
  }

  void setIsAnimatedEnded(bool isAnimatedEnded) {
    this.isAnimatedEnded = isAnimatedEnded;
    update();
  }

  void submitToInitialScreen() {
    if (summonerName.isEmpty) {
      isSummonerNameEmpty = true;
      update();
      return;
    }
    if (summonerName.isNotEmpty) {
      Get.offNamed('/initial_screen', arguments: summonerName);
    }
  }

  void writeAnswerInMemory(String answer) {
    _getStorage.write('answer', answer);
  }

  Future<bool> checkIfSummonerExisits() async {
    try {
      final bool response =
          await _conditionalLoginRepository.verifySummonerName(summonerName);
      return response;
    } catch (e) {
      return false;
    }
  }
}
