import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ChampionImageBackground extends StatelessWidget {
  final String championImageUrl;
  const ChampionImageBackground({Key? key, required this.championImageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border = BorderRadius.circular(15);

    return PhysicalModel(
      color: Colors.transparent,
      elevation: 10,
      borderRadius: border,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: const EdgeInsets.only(left: 25, right: 25),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: CachedNetworkImage(
            imageUrl: championImageUrl,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            height: MediaQuery.of(context).size.height * 0.6,
            fit: BoxFit.cover,
            alignment: const Alignment(0.5, -1),
          ),
        ),
      ),
    );
  }
}
