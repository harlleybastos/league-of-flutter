import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:initial_app/controller/search_section_controller.dart';
import 'package:initial_app/widgets/global/app_name.dart';
import 'package:initial_app/widgets/global/app_bar.dart';
import 'package:initial_app/widgets/global/app_input.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchSectionController>(
      builder: (controller) => Scaffold(
        appBar: customAppBar(context, 'Harlley'),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              const AppName(),
              Positioned(
                left: 0,
                right: 0,
                child: AppInput(
                  focusNode: controller.focusNode,
                  textEditingController: controller.textController,
                  hintText: 'Search a summoner',
                  onChanged: (e) {
                    if (e.isNotEmpty && e.length > 6) {
                      controller.findSummoner();
                    }
                  },
                  onSubmitted: (e) => controller.findSummoner,
                ),
              ),
              Positioned(
                top: 210,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
                child: controller.obx(
                  (state) {
                    return (KeyboardVisibilityBuilder(
                      builder: (builder, visible) {
                        if (!visible) {
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: const AlwaysScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
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
                                      left: MediaQuery.of(context).size.width *
                                          0.05,
                                      right: MediaQuery.of(context).size.width *
                                          0.05,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
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
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
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
                                                15,
                                            left: 150,
                                            right: 0,
                                            child: Text(
                                              state![0].summonerName.toString(),
                                              style: const TextStyle(
                                                fontSize: 30,
                                                color: Colors.white,
                                                fontFamily: 'Montserrat',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned.fill(
                                      top: 10,
                                      bottom: 10,
                                      right: 160,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: SvgPicture.asset(
                                          'assets/ranked-emblems/${state[0].tier.toLowerCase()}.svg',
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 175,
                                      top: MediaQuery.of(context).size.height *
                                              0.1 +
                                          50,
                                      right: 0,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state[0].tier.toString(),
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontFamily: 'BeaufortForLOL',
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              state[0].rank.toString(),
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontFamily: 'AvantGarde',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // Positioned(
                                    //   left: MediaQuery.of(context).size.width *
                                    //           0.4 +
                                    //       10,
                                    //   top: MediaQuery.of(context).size.height *
                                    //           0.2 -
                                    //       25,
                                    //   right: 0,
                                    //   child: Container(
                                    //     width:
                                    //         MediaQuery.of(context).size.width,
                                    //     height:
                                    //         MediaQuery.of(context).size.height,
                                    //     child: Row(
                                    //       crossAxisAlignment:
                                    //           CrossAxisAlignment.start,
                                    //       children: [
                                    //         Text(
                                    //           state[0]
                                    //               .queueType
                                    //               .replaceAll('_', ' '),
                                    //           style: const TextStyle(
                                    //             fontSize: 15,
                                    //             color: Colors.white,
                                    //             fontFamily: 'AvantGarde',
                                    //           ),
                                    //         ),
                                    //         const SizedBox(
                                    //           width: 5,
                                    //         ),
                                    //         Text(
                                    //           state[0].rank.toString(),
                                    //           style: const TextStyle(
                                    //             fontSize: 15,
                                    //             color: Colors.white,
                                    //             fontFamily: 'AvantGarde',
                                    //           ),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ),
                                    // Positioned(
                                    //   left: MediaQuery.of(context).size.width *
                                    //           0.4 +
                                    //       15,
                                    //   top: MediaQuery.of(context).size.height *
                                    //           0.1 +
                                    //       25,
                                    //   child: Container(
                                    //     width:
                                    //         MediaQuery.of(context).size.width,
                                    //     height:
                                    //         MediaQuery.of(context).size.height,
                                    //     child: Row(
                                    //       crossAxisAlignment:
                                    //           CrossAxisAlignment.start,
                                    //       children: [
                                    //         const Text(
                                    //           'Wins: ',
                                    //           style: TextStyle(
                                    //             fontSize: 15,
                                    //             color: Colors.white,
                                    //             fontFamily: 'BeaufortForLOL',
                                    //           ),
                                    //         ),
                                    //         Text(
                                    //           state[0].wins.toString(),
                                    //           style: const TextStyle(
                                    //             fontSize: 15,
                                    //             color: Colors.white,
                                    //             fontFamily: 'AvantGarde',
                                    //           ),
                                    //         ),
                                    //         const SizedBox(
                                    //           width: 5,
                                    //         ),
                                    //         const Text(
                                    //           'Losses: ',
                                    //           style: TextStyle(
                                    //             fontSize: 15,
                                    //             color: Colors.white,
                                    //             fontFamily: 'BeaufortForLOL',
                                    //           ),
                                    //         ),
                                    //         Text(
                                    //           state[0].losses.toString(),
                                    //           style: const TextStyle(
                                    //             fontSize: 15,
                                    //             color: Colors.white,
                                    //             fontFamily: 'AvantGarde',
                                    //           ),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
