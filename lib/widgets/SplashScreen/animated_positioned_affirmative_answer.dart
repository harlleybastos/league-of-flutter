import 'package:flutter/material.dart';

class AnimatedPositionedAffirmativeAnswer extends StatelessWidget {
  final String response;
  final Function setResponse;
  final Function setIsAnimatedEnded;
  const AnimatedPositionedAffirmativeAnswer(
      {Key? key,
      required this.response,
      required this.setResponse,
      required this.setIsAnimatedEnded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeInOut,
      onEnd: () => setIsAnimatedEnded(true),
      top: MediaQuery.of(context).size.height * 0.45,
      left: response == '' ? 0 : 520,
      right: response == '' ? 0 : -450,
      child: GestureDetector(
        onTap: () => setResponse('true'),
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
            'I would like to see my summoner\'s Informations.'.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'ITC_Avant_Garde_Gothic'),
          ),
        ),
      ),
    );
  }
}
