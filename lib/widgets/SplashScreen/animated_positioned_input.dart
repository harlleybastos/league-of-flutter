import 'package:flutter/material.dart';

class AnimatedPositionedInput extends StatelessWidget {
  final bool isAnimatedEnded;
  final String isSearching;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final Function submitFuncion;
  final String response;
  const AnimatedPositionedInput(
      {Key? key,
      required this.focusNode,
      required this.isSearching,
      required this.isAnimatedEnded,
      required this.textEditingController,
      required this.submitFuncion,
      required this.response})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeInOut,
      top: MediaQuery.of(context).size.height * 0.45,
      left: isAnimatedEnded && response == 'true' ? 0 : -500,
      right: isAnimatedEnded && response == 'true' ? 0 : 450,
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
            child: TextField(
              controller: textEditingController,
              focusNode: focusNode,
              onSubmitted: (e) => submitFuncion(),
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 20,
                fontFamily: 'ITC_Avant_Garde_Gothic',
              ),
              textAlign: TextAlign.start,
              decoration: const InputDecoration(
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
          textEditingController.text.isNotEmpty && isSearching == 'false'
              ? Container(
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
                    onPressed: () => submitFuncion(),
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
              : Container()
        ],
      ),
    );
  }
}
