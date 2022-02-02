import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:initial_app/models/champion.dart';
import '../ChampionsList/champion_gradient_background.dart';
import '../ChampionsList/champion_icon.dart';
import '../ChampionsList/champion_image_background.dart';

class ChampionContainer extends StatefulWidget {
  final Champion championData;

  const ChampionContainer({Key? key, required this.championData}) : super(key: key);

  @override
  State<ChampionContainer> createState() => _ChampionContainerState();
}

class _ChampionContainerState extends State<ChampionContainer> {
  int championSkins = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () async {
        String championName = widget.championData.id;
        Get.toNamed('/champion-details', arguments: {
          'championName': championName,
        });
      },
      child: Container(
        width: size.width,
        height: 200,
        margin: const EdgeInsets.all(20),
        child: Stack(
          children: [
            ChampionImageBackground(
              championImageUrl: widget.championData.image,
            ),
            const ChampionGradientBackground(),
            ChampionIcon(widget.championData),
          ],
        ),
      ),
    );
  }
}
