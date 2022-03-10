import 'package:flutter/material.dart';

class PositionedGradientForSummonerLevel extends StatelessWidget {
  const PositionedGradientForSummonerLevel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: MediaQuery.of(context).size.width * 0.45,
      bottom: MediaQuery.of(context).size.height * 0.32,
      height: MediaQuery.of(context).size.height * 0.07,
      child: Container(
        width: 240,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Color.fromARGB(255, 155, 73, 6),
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }
}
