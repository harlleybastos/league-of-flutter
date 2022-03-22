import 'package:flutter/material.dart';

class PositionedButtonNegativeAnswer extends StatelessWidget {
  Function responseSetter;
  PositionedButtonNegativeAnswer({Key? key, required this.responseSetter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.60,
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: () => responseSetter('false'),
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
    );
  }
}
