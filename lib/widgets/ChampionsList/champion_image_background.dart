import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ChampionImageBackground extends StatelessWidget {
  final String championImageUrl;
  const ChampionImageBackground({Key? key, required this.championImageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.only(left: 35, right: 40),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: CachedNetworkImage(
          imageUrl: championImageUrl,
          height: MediaQuery.of(context).size.height * 0.6,
          width: 100,
          fit: BoxFit.cover,
          alignment: const Alignment(0.62, 0),
        ),
      ),
    );
  }
}
