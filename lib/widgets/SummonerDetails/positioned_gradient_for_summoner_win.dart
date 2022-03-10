import 'package:flutter/material.dart';

class PositionedGradientForSummonerWins extends StatelessWidget {
  const PositionedGradientForSummonerWins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: MediaQuery.of(context).size.width * 0.75,
      bottom: MediaQuery.of(context).size.height * 0.20,
      top: MediaQuery.of(context).size.height * 0.70,
      child: Container(
        height: 350,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 6, 155, 98),
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }
}
