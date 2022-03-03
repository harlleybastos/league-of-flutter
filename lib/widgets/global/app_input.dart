import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

class AppInput extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final void Function()? onPressed;
  final String? hintText;
  final Rx<bool> userIsTipyng;

  final String inputText = '';
  const AppInput(
      {Key? key,
      required this.focusNode,
      required this.textEditingController,
      required this.hintText,
      required this.onPressed,
      required this.userIsTipyng})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                icon: isKeyboardVisible && textEditingController.text.isEmpty
                    ? const Icon(Icons.delete)
                    : const Icon(Icons.search),
                color: const Color(0xFF939392),
                iconSize: 30,
                onPressed:
                    isKeyboardVisible && textEditingController.text.isEmpty
                        ? () {
                            textEditingController.text = '';
                          }
                        : onPressed,
              );
            },
          ),
        ),
      ),
    );
  }
}
