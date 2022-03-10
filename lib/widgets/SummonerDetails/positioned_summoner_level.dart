import 'package:flutter/material.dart';

class PositionedSummonerLevel extends StatelessWidget {
  final String? level;
  const PositionedSummonerLevel({Key? key, required this.level})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 50,
      top: MediaQuery.of(context).size.height * 0.62,
      child: Container(
        child: Center(
          child: Text(
            level!,
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
