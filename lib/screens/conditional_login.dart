import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/conditional_login_controller.dart';

import '../widgets/ConditionalLogin/positioned_button_affirmative_answer.dart';
import '../widgets/ConditionalLogin/postioned_button_negative_answer.dart';
import '../widgets/ConditionalLogin/postioned_gnar.dart';
import '../widgets/ConditionalLogin/postioned_logo.dart';

class ConditionalLogin extends StatelessWidget {
  const ConditionalLogin({Key? key}) : super(key: key);

  Widget visualizeResponse(
      String response, Function setResponse, BuildContext context) {
    switch (response) {
      case 'true':
        return Positioned(
          top: MediaQuery.of(context).size.height * 0.45,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 35, right: 35),
                padding: const EdgeInsets.only(left: 20, top: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color(0xFF2d2c2c),
                ),
                child: const TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'ITC_Avant_Garde_Gothic',
                  ),
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: 'Enter your summoner name',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 105, 105, 105),
                      fontSize: 20,
                      fontFamily: 'ITC_Avant_Garde_Gothic',
                    ),
                  ),
                ),
              ),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width * 0.4,
                margin: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color(0xFF2d2c2c),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFb463a4),
                      Color(0xFF9b455f),
                    ],
                  ),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Submit'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'ITC_Avant_Garde_Gothic',
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      case 'false':
        return PositionedButtonNegativeAnswer(responseSetter: setResponse);
      default:
        return Stack(
          children: [
            PositionedButtonNegativeAnswer(responseSetter: setResponse),
            PostionedButtonAffirmativeAnswer(responseSetter: setResponse)
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConditionalLoginController>(builder: (controller) {
      return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.transparent,
            child: Stack(
              children: [
                const PostionedLogo(),
                // visualizeResponse(
                //     controller.response, controller.setResponse, context),

                AnimatedPositioned(
                  duration: const Duration(milliseconds: 1200),
                  curve: Curves.easeInOut,
                  top: MediaQuery.of(context).size.height * 0.45,
                  left: controller.isAnimatedEnded ? 0 : -500,
                  right: controller.isAnimatedEnded ? 0 : 450,
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(left: 35, right: 35),
                        padding: const EdgeInsets.only(left: 20, top: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: const Color(0xFF2d2c2c),
                        ),
                        child: const TextField(
                          style: TextStyle(
                            color: Color.fromARGB(255, 12, 2, 2),
                            fontSize: 20,
                            fontFamily: 'ITC_Avant_Garde_Gothic',
                          ),
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            hintText: 'Enter your summoner name',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 105, 105, 105),
                              fontSize: 20,
                              fontFamily: 'ITC_Avant_Garde_Gothic',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width * 0.4,
                        margin: const EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: const Color(0xFF2d2c2c),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFb463a4),
                              Color(0xFF9b455f),
                            ],
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Submit'.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'ITC_Avant_Garde_Gothic',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 1200),
                  curve: Curves.easeInOut,
                  top: MediaQuery.of(context).size.height * 0.60,
                  left: controller.response == '' ? 0 : -550,
                  right: controller.response == '' ? 0 : 450,
                  child: GestureDetector(
                    onTap: () => controller.setResponse('false'),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF010116).withOpacity(.7),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFb463a4).withOpacity(0.5),
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
                ),

                AnimatedPositioned(
                  duration: const Duration(milliseconds: 1200),
                  curve: Curves.easeInOut,
                  onEnd: () => controller.setIsAnimatedEnded(true),
                  top: MediaQuery.of(context).size.height * 0.45,
                  left: controller.response == '' ? 0 : 520,
                  right: controller.response == '' ? 0 : -450,
                  child: GestureDetector(
                    onTap: () => controller.setResponse('true'),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF9b455f),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFb463a4).withOpacity(0.5),
                            blurRadius: 20,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'I would like to see my summoner\'s Informations.'
                            .toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'ITC_Avant_Garde_Gothic'),
                      ),
                    ),
                  ),
                ),
                const PositionedGnar(),
              ],
            )),
      );
    });
  }
}
