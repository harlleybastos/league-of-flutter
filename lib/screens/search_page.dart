import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:league_of_flutter/controller/search_section_controller.dart';
import 'package:league_of_flutter/widgets/global/app_input.dart';

class SearchPage extends StatelessWidget {
  final String? language;
  final String? version;
  const SearchPage({Key? key, this.language, this.version}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchSectionController>(
      builder: (controller) => Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              AppInput(
                focusNode: controller.focusNode,
                textEditingController: controller.textController,
                hintText: 'Search a summoner',
                onPressed: controller.findSummoner,
                userIsTipyng: controller.userIsTipyng,
                summonerDetails: controller.summonerDetails,
                errorInSearch: controller.errorInSearch,
              ),
              Positioned(
                top: 210,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
                child: controller.obx(
                    (state) {
                      return (KeyboardVisibilityBuilder(
                        builder: (builder, visible) {
                          if (!visible &&
                              controller.summonerMainChampionSkin != '') {
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              physics: const AlwaysScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (_, index) {
                                print(state[index].tier);
                                return GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/summoner-details',
                                        arguments: {
                                          'summonerData': state[index],
                                          'summonerMainChampionSkin': controller
                                              .summonerMainChampionSkin,
                                        });
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xFFb463a4)
                                              .withOpacity(0.2),
                                          blurRadius: 20,
                                          spreadRadius: 2,
                                        ),
                                      ],
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned.fill(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                20,
                                              ),
                                              image: DecorationImage(
                                                  image: CachedNetworkImageProvider(
                                                      controller
                                                          .summonerMainChampionSkin),
                                                  fit: BoxFit.cover,
                                                  alignment: Alignment(-1, -1)),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          margin: const EdgeInsets.only(
                                            right: 19,
                                            left: 19,
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                top: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.1 +
                                                    20,
                                                left: -10,
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  decoration:
                                                      BoxDecoration(boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.9),
                                                      blurRadius: 15,
                                                      spreadRadius: 2,
                                                    ),
                                                  ]),
                                                ),
                                              ),
                                              Positioned(
                                                top: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.1 +
                                                    20,
                                                left: 120,
                                                right: 0,
                                                child: Text(
                                                  state[index]
                                                      .summonerName
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned.fill(
                                          top: 10,
                                          bottom: 10,
                                          right: 180,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: SvgPicture.asset(
                                              'assets/ranked-emblems/${state[index].tier.toLowerCase()}.svg',
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 185,
                                          top: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.1 +
                                              50,
                                          right: 0,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  state[index].tier.toString(),
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                    fontFamily:
                                                        'ITC_Avant_Garde_Gothic',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  state[index].rank.toString(),
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                    fontFamily:
                                                        'ITC_Avant_Garde_Gothic',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: state!.length,
                            );
                          }

                          return Container();
                        },
                      ));
                    },
                    onLoading: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/gif/league-of-flutter-loading-image.gif',
                          ),
                        ],
                      ),
                    ),
                    onEmpty: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/gif/league-of-legends-no-type.gif',
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: const Text(
                              'Type a Summoner name',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFc4f1fc),
                                fontFamily: 'AvantGarde',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onError: (err) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 300,
                              child: Image.asset(
                                'assets/img/league-of-flutter-not-found-blitzcrank.png',
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: const Text(
                                'Summoner not found !',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFc4f1fc),
                                  fontFamily: 'AvantGarde',
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
