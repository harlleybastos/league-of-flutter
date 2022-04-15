import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:initial_app/widgets/global/app_bar.dart';
import '../controller/home_page_controller.dart';

class HomeSection extends StatelessWidget {
  final String? language;
  final String? version;
  const HomeSection({Key? key, this.language, this.version}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (controller) {
      return Scaffold(
        appBar: customAppBar(context, controller.summonerData['name']),
        body: Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.1,
                left: MediaQuery.of(context).size.width * 0.1,
                child: Container(),
              ),
            ],
          ),
        ),
      );
    });
  }
}
