import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedPositionedNegativeAnswer extends StatelessWidget {
  final String response;
  final Function setResponse;
  final Function writeAnswerInMemory;
  const AnimatedPositionedNegativeAnswer(
      {Key? key,
      required this.response,
      required this.setResponse,
      required this.writeAnswerInMemory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeInOut,
      top: MediaQuery.of(context).size.height * 0.60,
      left: response != '' ? -550 : 0,
      right: response != '' ? 450 : 0,
      child: GestureDetector(
        onTap: () => {
          setResponse('false'),
          writeAnswerInMemory('false'),
          Timer(const Duration(milliseconds: 1300), () {
            Get.offNamed('/initial_screen');
          })
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF010116).withOpacity(.7),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFb463a4).withOpacity(0.5),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          margin: const EdgeInsets.symmetric(horizontal: 15),
          padding: const EdgeInsets.all(10),
          child: Text(
            'I wouldn\'t like to see my summoner\'s Informations.'
                .toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontFamily: 'ITC_Avant_Garde_Gothic',
            ),
          ),
        ),
      ),
    );
  }
}
