import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ChampionImageBackground extends StatelessWidget {
  final String championImageUrl;

  const ChampionImageBackground({Key? key, required this.championImageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        child: CachedNetworkImage(
          imageUrl: championImageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
