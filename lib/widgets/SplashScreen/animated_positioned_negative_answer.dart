import 'package:flutter/material.dart';

class AnimatedPositionedNegativeAnswer extends StatelessWidget {
  final String response;
  final Function setResponse;
  const AnimatedPositionedNegativeAnswer(
      {Key? key, required this.response, required this.setResponse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeInOut,
      top: MediaQuery.of(context).size.height * 0.60,
      left: response == '' ? 0 : -550,
      right: response == '' ? 0 : 450,
      child: GestureDetector(
        onTap: () => setResponse('false'),
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
