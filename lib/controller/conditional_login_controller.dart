import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:league_of_flutter/repository/i_conditional_login_repository.dart';

class ConditionalLoginController extends GetxController with StateMixin {
  String response = '';
  bool isAnimatedEnded = false;
  String summonerName = '';
  String isSearching = '';
  bool isSummonerNameEmpty = false;
  bool summonerNotFound = false;
  final IConditionalLoginRepository _conditionalLoginRepository;
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final GetStorage _getStorage = GetStorage();

  ConditionalLoginController(this._conditionalLoginRepository);

  @override
  void onInit() {
    textEditingController.addListener(() {
      summonerName = textEditingController.text;
      if (textEditingController.text.isEmpty) {
        isSummonerNameEmpty = true;
        update();
      } else {
        isSummonerNameEmpty = false;
        update();
      }
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

  void submitToInitialScreen() async {
    if (!isSummonerNameEmpty) {
      Map<String, dynamic> summonerData = await checkIfSummonerExisits();
      if (summonerData.isNotEmpty) {
        _getStorage.write('summonerData', summonerData);
        _getStorage.write('summonerName', summonerName);
        Get.offNamed('/initial_screen');
      }
      summonerNotFound = true;
      update();
    }
  }

  void writeAnswerInMemory(String answer) {
    _getStorage.write('answer', answer);
  }

  Future<Map<String, dynamic>> checkIfSummonerExisits() async {
    try {
      isSearching = "true";
      update();
      final response =
          await _conditionalLoginRepository.verifySummonerName(summonerName);
      return response;
    } catch (e) {
      return {};
    } finally {
      Timer(const Duration(milliseconds: 1000), () {
        isSearching = "false";
        update();
      });
    }
  }

  Widget conditionalBaloon(BuildContext context) {
    if (response == "true" && isSummonerNameEmpty) {
      return AnimatedPositioned(
        duration: const Duration(milliseconds: 1500),
        curve: Curves.easeInOut,
        bottom: 0,
        left: MediaQuery.of(context).size.width * 0.2,
        right: MediaQuery.of(context).size.width * 0.02,
        child: Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/gif/baloon.gif',
          ),
        ),
      );
    }

    if (response == "true" && isSearching == "true") {
      return AnimatedPositioned(
        duration: const Duration(milliseconds: 1500),
        curve: Curves.easeInOut,
        bottom: 0,
        left: MediaQuery.of(context).size.width * 0.2,
        right: MediaQuery.of(context).size.width * 0.02,
        child: Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/gif/searching-summoner.gif',
          ),
        ),
      );
    }

    if (summonerNotFound) {
      return AnimatedPositioned(
        duration: const Duration(milliseconds: 1500),
        curve: Curves.easeInOut,
        bottom: 0,
        left: MediaQuery.of(context).size.width * 0.2,
        right: MediaQuery.of(context).size.width * 0.02,
        child: Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/gif/summoner-not-found.gif',
          ),
        ),
      );
    }
    return Container();
  }
}
