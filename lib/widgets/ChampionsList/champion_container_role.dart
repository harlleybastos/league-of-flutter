import 'package:flutter/material.dart';
import 'package:league_of_flutter/models/champion.dart';

class ChampionContainerRole extends StatelessWidget {
  final Champion championData;

  const ChampionContainerRole({Key? key, required this.championData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 65,
      left: 0,
      right: 0,
      child: Text(
        championData.tags[0],
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
