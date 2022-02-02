import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:initial_app/models/champion.dart';

class ChampionIcon extends StatelessWidget {
  final Champion championData;

  ChampionIcon(this.championData);
  
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: 'https://ddragon.leagueoflegends.com/cdn/11.24.1/img/champion/${championData.id}.png',
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
                ),
              ),
              Text(
                championData.title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
