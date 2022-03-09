import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PositionedSummonerIcon extends StatelessWidget {
  final String summonerIconUrl;
  const PositionedSummonerIcon({Key? key, required this.summonerIconUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 25,
      top: MediaQuery.of(context).size.height * 0.44,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(
              summonerIconUrl,
            ),
          ),
        ),
      ),
    );
  }
}
