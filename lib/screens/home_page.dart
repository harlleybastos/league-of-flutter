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
      appBar: customAppBar(context, 'Harlley'),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: const Text(
              'Champion of the Day',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: size.width,
              height: 200,
              margin: const EdgeInsets.all(20),
              child: Stack(
                children: const [
                  ChampionImageBackground(
                    championImageUrl: 'Aatrox',
                  ),
                  ChampionGradientBackground(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
