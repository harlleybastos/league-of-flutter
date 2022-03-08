import 'package:flutter/material.dart';

class PositionedSummonerName extends StatelessWidget {
  final String? summonerName;
  const PositionedSummonerName({Key? key, required this.summonerName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: MediaQuery.of(context).size.width * 0.5,
      top: MediaQuery.of(context).size.height * 0.4,
      bottom: MediaQuery.of(context).size.height * 0.44,
      child: Container(
        width: double.maxFinite,
        child: Center(
          child: Text(
            summonerName!,
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
