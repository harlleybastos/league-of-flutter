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
              Positioned.fill(
                top: MediaQuery.of(context).size.height * 0.40,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    // TODO - Create an filter that get the matches with the same SummonerName of the summoner
                    print(controller.data[index].info!.participants!
                        .map((e) => e.summonerName));
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      color: Colors.red,
                    );
                  },
                  itemCount: controller.data.length,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
