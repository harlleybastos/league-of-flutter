import 'package:flutter/material.dart';

import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';

import '../widgets/ChampionsList/champion_container_gradient.dart';
import '../widgets/ChampionsList/champion_container_role.dart';
import '../widgets/ChampionsList/champion_container_role_name.dart';
import '../widgets/ChampionsList/champion_not_found.dart';
import '../widgets/ChampionsList/champion_container.dart';

import '../controller/champion_list_controller.dart';

class ChampionsList extends StatelessWidget {
  final String? language;
  final String? version;
  const ChampionsList({Key? key, this.language, this.version})
      : super(key: key);

  Widget loadingShimmer(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Container(
                width: 165,
                height: 35,
                color: Colors.grey[300],
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 40,
            right: 120,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 165,
                height: 35,
                color: Colors.grey[300],
              ),
            ),
          ),
          Positioned(
            left: 40,
            top: 88,
            right: 40,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 165,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[300],
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 160,
            right: 30,
            bottom: MediaQuery.of(context).size.width * 0.3,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  margin: const EdgeInsets.only(left: 40, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey[300],
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(height: 16),
                itemCount: 3,
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 125,
            right: 175,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[300],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 85,
            left: 125,
            right: 175,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[300],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChampionListController>(
        builder: (controller) => Scaffold(
              body: Stack(
                children: [
                  controller.obx(
                    (state) {
                      return KeyboardVisibilityBuilder(
                          builder: (builder, visible) {
                        if (!visible) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: state!.length,
                            itemBuilder: (_, index) {
                              return Stack(
                                children: [
                                  const ChampionContainerGradient(),
                                  ChampionContainerRole(
                                    championData: state[index],
                                  ),
                                  ChampionContainerRoleName(
                                    championData: state[index],
                                  ),
                                  ChampionContainer(
                                    championData: state[index],
                                    version: version!,
                                  ),
                                ],
                              );
                            },
                          );
                        }
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.searchResult.length,
                          itemBuilder: (_, index) {
                            return Stack(
                              children: [
                                Positioned(
                                    left: 20,
                                    right: 20,
                                    bottom: 150,
                                    top: 160,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xFFb463a4)
                                                .withOpacity(0.2),
                                            blurRadius: 20,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                      ),
                                    )),
                                Positioned(
                                  bottom: 65,
                                  left: 0,
                                  right: 0,
                                  child: Text(
                                    controller.searchResult[index].tags[0],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Positioned(
                                  bottom: 15,
                                  left: 0,
                                  right: 0,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    child: SvgPicture.asset(
                                      'assets/roles/${controller.searchResult[index].tags[0].toLowerCase()}.svg',
                                    ),
                                  ),
                                ),
                                ChampionContainer(
                                  championData: controller.searchResult[index],
                                  version: version!,
                                ),
                              ],
                            );
                          },
                        );
                      });
                    },
                    onError: (error) {
                      return KeyboardVisibilityBuilder(
                        builder: (keyboardBuilder, isKeyboardVisible) {
                          return !isKeyboardVisible
                              ? ChampionNotFound(
                                  error: error,
                                )
                              : Container();
                        },
                      );
                    },
                    onLoading: loadingShimmer(context),
                  ),
                  controller.pageIsLoaded
                      ? Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(
                              left: 40, right: 40, top: 90),
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: const Color(0xFF2d2c2c),
                          ),
                          child: TextField(
                            focusNode: controller.focusNode,
                            controller: controller.textController,
                            onSubmitted: (value) {
                              FocusScope.of(context).unfocus();
                              controller.filterListOfChampionsByName(
                                  controller.textController.text);
                            },
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Search a Champion',
                              border: InputBorder.none,
                              hintStyle: const TextStyle(
                                color: Color(0xFF474646),
                                fontFamily: 'Montserrat',
                              ),
                              suffixIcon: KeyboardVisibilityBuilder(
                                builder: (contextKeyboard, isKeyboardVisible) {
                                  return IconButton(
                                    icon: controller.textController.text
                                                .isNotEmpty &&
                                            controller.searchResult.isNotEmpty
                                        ? const Icon(Icons.delete)
                                        : const Icon(Icons.search),
                                    color: const Color(0xFF939392),
                                    iconSize: 30,
                                    onPressed: controller.textController.text
                                                .isNotEmpty &&
                                            controller.searchResult.isNotEmpty
                                        ? () {
                                            FocusScope.of(context).unfocus();
                                            controller.searchResult = [];
                                            controller.textController.clear();
                                            controller
                                                .filterListOfChampionsByName(
                                                    controller
                                                        .textController.text);
                                          }
                                        : () {
                                            FocusScope.of(context).unfocus();
                                            controller
                                                .filterListOfChampionsByName(
                                                    controller
                                                        .textController.text);
                                          },
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ));
  }
}
