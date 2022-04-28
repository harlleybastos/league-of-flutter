import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/HomeSection/background_image_gradient.dart';
import '../widgets/HomeSection/condition_shimmer_image.dart';

import '../controller/home_page_controller.dart';

class HomeSection extends StatelessWidget {
  final String? language;
  final String? version;
  const HomeSection({Key? key, this.language, this.version}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (controller) {
      return Scaffold(
        body: Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              const BackgroundImageGradient(),
              ConditionalRenderingImage(mainChampion: controller.mainChampion),
            ],
          ),
        ),
      );
    });
  }
}
