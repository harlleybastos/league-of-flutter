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
                    print(e);
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
                child: controller.obx((state) {
                  return (KeyboardVisibilityBuilder(
                    builder: (builder, visible) {
                      if (!visible) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (_, index) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFb463a4).withOpacity(0.2),
                                    blurRadius: 20,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xFFb463a4),
                                    ),
                                    margin: const EdgeInsets.only(
                                      right: 20,
                                      left: 20,
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 60,
                                          top: -50,
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              -0.1,
                                          right: -15,
                                          child: Container(
                                            width: double.maxFinite,
                                            height: double.maxFinite,
                                            child: SvgPicture.asset(
                                                'assets/ranked-emblems/${state![index].tier.toLowerCase()}.svg'),
                                          ),
                                        ),
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
                                                    .withOpacity(0.7),
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
                                          left: 10,
                                          child: Text(
                                            state[index]
                                                .summonerName
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontFamily: 'Montserrat',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    left: MediaQuery.of(context).size.width *
                                            0.1 +
                                        10,
                                    top: MediaQuery.of(context).size.height *
                                            0.1 +
                                        55,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state[index].tier.toString(),
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
                                            state[index].rank.toString(),
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
                                  Positioned(
                                    left: MediaQuery.of(context).size.width *
                                            0.4 +
                                        10,
                                    top: MediaQuery.of(context).size.height *
                                            0.2 -
                                        25,
                                    right: 0,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state[index]
                                                .queueType
                                                .replaceAll('_', ' '),
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontFamily: 'AvantGarde',
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            state[0].championId.toString(),
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
                                  Positioned(
                                    left: MediaQuery.of(context).size.width *
                                            0.4 +
                                        15,
                                    top: MediaQuery.of(context).size.height *
                                            0.1 +
                                        25,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Wins: ',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontFamily: 'BeaufortForLOL',
                                            ),
                                          ),
                                          Text(
                                            state[index].wins.toString(),
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontFamily: 'AvantGarde',
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text(
                                            'Losses: ',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontFamily: 'BeaufortForLOL',
                                            ),
                                          ),
                                          Text(
                                            state[index].losses.toString(),
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
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
