import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:league_of_flutter/models/champion.dart';

class ChampionIcon extends StatelessWidget {
  final Champion championData;
  final String version;

  ChampionIcon(this.championData, this.version);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 25,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl:
                    'https://ddragon.leagueoflegends.com/cdn/${version}/img/champion/${championData.id}.png',
                height: 50,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                championData.name,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'BeaufortForLOL'),
              ),
              Text(
                championData.title,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontFamily: 'ITC_Avant_Garde_Gothic'),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
