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
        resizeToAvoidBottomInset: false,
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
                      isSearching: controller.isSearching,
                      textEditingController: controller.textEditingController,
                      focusNode: controller.focusNode,
                      submitFuncion: controller.submitToInitialScreen,
                      response: controller.response,
                    ),
                    AnimatedPositionedNegativeAnswer(
                        response: controller.response,
                        setResponse: controller.setResponse,
                        writeAnswerInMemory: controller.writeAnswerInMemory),
                    AnimatedPositionedAffirmativeAnswer(
                        response: controller.response,
                        setIsAnimatedEnded: controller.setIsAnimatedEnded,
                        setResponse: controller.setResponse,
                        writeAnswerInMemory: controller.writeAnswerInMemory),
                    !isKeyboardVisible ? const PositionedGnar() : Container(),
                    !isKeyboardVisible
                        ? controller.conditionalBaloon(context)
                        : Container(),
                  ],
                );
              },
            )),
      );
    });
  }
}
