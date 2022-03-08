import 'package:flutter/material.dart';

class PositionedGradientForSummonerName extends StatelessWidget {
  const PositionedGradientForSummonerName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: MediaQuery.of(context).size.height * 0.45,
      height: MediaQuery.of(context).size.height * 0.07,
      child: Container(
        width: 240,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF9b455f),
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }
}
