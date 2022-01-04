import 'package:flutter/material.dart';
import 'package:initial_app/widgets/champion_gradient_background.dart';
import 'package:initial_app/widgets/champion_icon.dart';
import 'package:initial_app/widgets/champion_image_background.dart';

class ChampionContainer extends StatelessWidget {
  final Map<String, dynamic> championData;

  const ChampionContainer({Key? key, required this.championData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: size.width,
        height: 200,
        margin: const EdgeInsets.all(20),
        child: Stack(
          children: [
            ChampionImageBackground(championName: championData['id'],),
            const ChampionGradientBackground(),
            ChampionIcon(championData),
          ],
        ),
      ),
    );
  }
}
