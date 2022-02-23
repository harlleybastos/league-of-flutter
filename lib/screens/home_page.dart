import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_page_controller.dart';
import '../widgets/ChampionsList/champion_image_background.dart';

class HomeSection extends GetView<HomePageController> {
  const HomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          ChampionImageBackground(
            championImageUrl: 'Aatrox',
          ),
        ],
      ),
    );
  }
}
