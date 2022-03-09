import 'package:flutter/material.dart';

class PositionedSummonerLeaguePoints extends StatelessWidget {
  final String leaguePoints;
  const PositionedSummonerLeaguePoints({Key? key, required this.leaguePoints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: MediaQuery.of(context).size.width * 0.5,
      bottom: MediaQuery.of(context).size.height * 0.12,
      child: Container(
        child: Center(
          child: Text(
            leaguePoints,
            style: const TextStyle(
              fontSize: 22,
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
