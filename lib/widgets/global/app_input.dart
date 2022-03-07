import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:initial_app/controller/search_section_controller.dart';
import 'package:initial_app/models/summoner_details.dart';

class AppInput extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final void Function()? onPressed;
  final String? hintText;
  final Rx<bool> userIsTipyng;
  final List<SummonerDetails> summonerDetails;

  final String inputText = '';
  const AppInput(
      {Key? key,
      required this.summonerDetails,
      required this.focusNode,
      required this.textEditingController,
      required this.hintText,
      required this.onPressed,
      required this.userIsTipyng})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchSectionController>(
      builder: (controller) {
        return Container(
          height: 45,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: 40, right: 40, top: 90),
          padding: const EdgeInsets.only(
            left: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: const Color(0xFF2d2c2c),
          ),
          child: TextField(
            focusNode: focusNode,
            controller: textEditingController,
            onChanged: (value) {
              print(textEditingController.text);
            },
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              hintStyle: const TextStyle(
                color: Color(0xFF474646),
                fontFamily: 'Montserrat',
              ),
              suffixIcon: KeyboardVisibilityBuilder(
                builder: (context, isKeyboardVisible) {
                  if (!isKeyboardVisible) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                  return IconButton(
                    icon: !isKeyboardVisible &&
                            controller.summonerDetails.isNotEmpty
                        ? const Icon(Icons.delete)
                        : const Icon(Icons.search),
                    color: const Color(0xFF939392),
                    iconSize: 30,
                    onPressed: !isKeyboardVisible && controller.summonerInformations
                            .isNotEmpty
                        ? controller.clearSearched
                        : onPressed,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
