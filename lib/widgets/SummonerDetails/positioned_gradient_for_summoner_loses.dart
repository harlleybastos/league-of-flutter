import 'package:flutter/material.dart';

class PositionedGradientForSummonerLosses extends StatelessWidget {
  const PositionedGradientForSummonerLosses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: MediaQuery.of(context).size.height * 0.80,
      bottom: MediaQuery.of(context).size.height * 0.10,
      left: MediaQuery.of(context).size.width * 0.75,
      child: Container(
        height: 350,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 155, 6, 26),
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }
}
