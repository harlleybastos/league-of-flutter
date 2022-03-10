import 'package:flutter/material.dart';

class PositionedSummonerLosses extends StatelessWidget {
  final String? losses;
  const PositionedSummonerLosses({Key? key, required this.losses})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 25,
      top: MediaQuery.of(context).size.height * 0.84,
      child: Container(
        child: Center(
          child: Text(
            losses!,
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
