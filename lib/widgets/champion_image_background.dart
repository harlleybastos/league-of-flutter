import 'package:flutter/material.dart';

class ChampionImageBackground extends StatelessWidget {
  final String championName;

  const ChampionImageBackground({Key? key, required this.championName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        child: Image.network(
          'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${championName}_0.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
