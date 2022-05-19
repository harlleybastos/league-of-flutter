import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:initial_app/models/summoner_match.dart';

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
                    Participants summoner = controller.filterChampionList(
                        controller.data[index].info!.participants!);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.15,
                          ),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              '${summoner.championName}',
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'BeaufortForLOL'),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            '${summoner.win}',
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF03c4e5),
                                fontFamily: 'ITC_Avant_Garde_Gothic'),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${summoner.championName}_0.jpg',
                              ),
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.8),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                            child: Stack(children: []),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.1,
                          ),
                          child: Text(
                            '${summoner.champLevel}',
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontFamily: 'ITC_Avant_Garde_Gothic'),
                          ),
                        ),
                      ],
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
