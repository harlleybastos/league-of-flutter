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
                top: MediaQuery.of(context).size.height * 0.50,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    Participants summoner = controller.filterChampionList(
                        controller.data[index].info!.participants!);
                    String gameMode = controller.changeTypeOfGameMode(
                        controller.data[index].info!.gameMode!);

                    return Stack(
                      children: [
                        Positioned(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.3,
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${summoner.championName}_0.jpg',
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                fit: BoxFit.fill,
                                alignment: const Alignment(0.4, -1),
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.25,
                          bottom: 0,
                          top: MediaQuery.of(context).size.height * 0.01,
                          child: Container(
                            color: Colors.transparent,
                            width: MediaQuery.of(context).size.width,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  color: const Color(0xFF00060e),
                                  border: Border.all(
                                    color: Color(0xFF7f6e3c),
                                    width: 1,
                                  ),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Center(
                                  child: Text(
                                    "${summoner.champLevel}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 212, 212, 211),
                                      fontFamily: 'BeaufortForLOL',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.20,
                          bottom: MediaQuery.of(context).size.height * 0.02,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  summoner.win!
                                      ? const Color(0xFF059ab0).withOpacity(0.9)
                                      : const Color(0xFFee1f3f)
                                          .withOpacity(0.9),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.2,
                          bottom: MediaQuery.of(context).size.height * 0.1,
                          child: Container(
                            color: Colors.transparent,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.15,
                            ),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                gameMode,
                                style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 243, 236, 219),
                                    fontFamily: 'BeaufortForLOL'),
                              ),
                            ),
                          ),
                        ),

                        // Positioned(
                        //   child: Container(
                        //     width: MediaQuery.of(context).size.width,
                        //     height: MediaQuery.of(context).size.height * 0.30,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(15),
                        //       image: DecorationImage(
                        //         image: CachedNetworkImageProvider(
                        //           ,
                        //         ),
                        //       ),
                        //     ),
                        //     margin: const EdgeInsets.symmetric(vertical: 15),
                        //     child: Container(
                        //       width: MediaQuery.of(context).size.width,
                        //       height: MediaQuery.of(context).size.height,
                        //       decoration: BoxDecoration(
                        //         gradient: LinearGradient(
                        //           begin: Alignment.bottomCenter,
                        //           end: Alignment.topCenter,
                        //           colors: [
                        //             Colors.black.withOpacity(0.5),
                        //             Colors.transparent,
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        // Positioned(
                        //   child: Container(
                        //     width: MediaQuery.of(context).size.width,
                        //     child: Text(
                        //       '${summoner.win}',
                        //       style: const TextStyle(
                        //           fontSize: 20,
                        //           fontWeight: FontWeight.w400,
                        //           color: Color(0xFF03c4e5),
                        //           fontFamily: 'ITC_Avant_Garde_Gothic'),
                        //     ),
                        //   ),
                        // ),

                        // Container(
                        //   width: MediaQuery.of(context).size.width,
                        //   margin: EdgeInsets.only(
                        //     left: MediaQuery.of(context).size.width * 0.1,
                        //   ),
                        //   child: Text(
                        //     '${summoner.champLevel}',
                        //     style: const TextStyle(
                        //         fontSize: 20,
                        //         fontWeight: FontWeight.w400,
                        //         color: Colors.white,
                        //         fontFamily: 'ITC_Avant_Garde_Gothic'),
                        //   ),
                        // ),
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
