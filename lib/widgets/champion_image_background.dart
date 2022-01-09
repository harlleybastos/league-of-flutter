import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

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
        child: CachedNetworkImage(
          imageUrl: 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${championName}_0.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
