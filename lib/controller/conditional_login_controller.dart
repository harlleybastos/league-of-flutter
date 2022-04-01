import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConditionalLoginController extends GetxController with StateMixin {
  String response = '';
  bool isAnimatedEnded = false;
  bool isSummonerNameEmpty = false;
  String summonerName = '';
  final TextEditingController textEditingController = TextEditingController();

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
}
