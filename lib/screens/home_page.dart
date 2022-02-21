import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_page_controller.dart';
import '../widgets/HomeSection/appbar.dart';
import '../widgets/ChampionsList/champion_gradient_background.dart';
import '../widgets/ChampionsList/champion_image_background.dart';

class HomeSection extends GetView<HomePageController> {
  const HomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
