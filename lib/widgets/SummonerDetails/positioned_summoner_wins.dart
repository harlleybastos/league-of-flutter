import 'package:flutter/material.dart';

class PositionedSummonerWins extends StatelessWidget {
  final String? wins;
  const PositionedSummonerWins({Key? key, required this.wins})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 25,
      top: MediaQuery.of(context).size.height * 0.74,
      child: Container(
        child: Center(
          child: Text(
            wins!,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
