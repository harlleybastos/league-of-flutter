import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChampionNotFound extends StatelessWidget {
  final String? error;
  const ChampionNotFound({Key? key, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         Image.asset(
            'assets/img/league-of-flutter-not-found-blitzcrank.png',
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Color(0xFFc4f1fc),
                fontFamily: 'AvantGarde',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
