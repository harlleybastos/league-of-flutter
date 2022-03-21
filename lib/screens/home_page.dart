import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:initial_app/widgets/global/app_bar.dart';
import '../controller/home_page_controller.dart';
import '../widgets/ChampionsList/champion_image_background.dart';

class HomeSection extends StatelessWidget {
  final String? language;
  final String? version;
  const HomeSection({Key? key, this.language, this.version}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (controller) {
      return Scaffold(
        appBar: customAppBar(context, 'Harlley'),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: const [
              ChampionImageBackground(
                championImageUrl: 'Aatrox',
              ),
            ],
          ),
        ),
      );
    });
  }
}
