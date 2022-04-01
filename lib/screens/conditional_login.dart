import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

import '../widgets/SplashScreen/animated_positioned_affirmative_answer.dart';
import '../widgets/SplashScreen/animated_positioned_negative_answer.dart';
import '../widgets/SplashScreen/animated_positioned_input.dart';
import '../widgets/ConditionalLogin/postioned_gnar.dart';
import '../widgets/ConditionalLogin/postioned_logo.dart';

import '../controller/conditional_login_controller.dart';

class ConditionalLogin extends StatelessWidget {
  const ConditionalLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConditionalLoginController>(builder: (controller) {
      return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.transparent,
            child: KeyboardVisibilityBuilder(
              builder: (contextKeyboard, isKeyboardVisible) {
                return Stack(
                  children: [
                    const PostionedLogo(),
                    AnimatedPositionedInput(
                      isAnimatedEnded: controller.isAnimatedEnded,
                      textEditingController: controller.textEditingController,
                      submitFuncion: controller.submitToInitialScreen,
                    ),
                    AnimatedPositionedNegativeAnswer(
                        response: controller.response,
                        setResponse: controller.setResponse),
                    AnimatedPositionedAffirmativeAnswer(
                        response: controller.response,
                        setIsAnimatedEnded: controller.setIsAnimatedEnded,
                        setResponse: controller.setResponse),
                    !isKeyboardVisible ? const PositionedGnar() : Container(),
                    !isKeyboardVisible
                        ? AnimatedPositioned(
                            duration: const Duration(milliseconds: 1500),
                            curve: Curves.easeInOut,
                            bottom: 0,
                            left: MediaQuery.of(context).size.width * 0.2,
                            right: MediaQuery.of(context).size.width * 0.02,
                            child: controller.isSummonerNameEmpty
                                ? Container(
                                    color: Colors.transparent,
                                    child: Image.asset(
                                      'assets/gif/baloon.gif',
                                    ),
                                  )
                                : Container(),
                          )
                        : Container(),
                  ],
                );
              },
            )),
      );
    });
  }
}
