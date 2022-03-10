import 'package:flutter/material.dart';

class PositionedGradientForSummonerRank extends StatelessWidget {
  const PositionedGradientForSummonerRank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      bottom: MediaQuery.of(context).size.height * 0.10,
      height: MediaQuery.of(context).size.height * 0.07,
      child: Container(
        width: 240,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 6, 133, 155),
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }
}
