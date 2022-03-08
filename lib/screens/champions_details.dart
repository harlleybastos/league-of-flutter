import 'dart:io';
import 'package:get/get.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../controller/champion_details_controller.dart';
import '../credentials/app_credentials.dart';
import '../widgets/ChampionsList/skins_buttons.dart';

class ChampionDetails extends GetView<ChampionDetailsController> {
  const ChampionDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.maxFinite,
        height: double.maxFinite,
        child: controller.obx(
          (state) {
            return state!.isNotEmpty
                ? Stack(
                    children: [
                      Positioned(
                        top: 320,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 500,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                            color: Color(0xFF040316),
                          ),
                          padding: const EdgeInsets.only(
                            right: 20,
                            left: 20,
                            top: 90,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Skins',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                height: 3,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xFF35b8e1),
                                        Color(0xFF06102d),
                                      ]),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Number of Skins of this champion',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                child: Wrap(
                                  children: List.generate(state['skins'].length,
                                      (index) {
                                    return InkWell(
                                      onTap: () =>
                                          controller.changeIndex(index),
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          right: 10,
                                        ),
                                        child: SkinsButtons(
                                          size: 50,
                                          color:
                                              controller.selectedIndex == index
                                                  ? Colors.white
                                                  : Colors.black,
                                          backgroundColor:
                                              controller.selectedIndex == index
                                                  ? Colors.black
                                                  : Colors.grey,
                                          borderColor:
                                              controller.selectedIndex == index
                                                  ? Colors.black
                                                  : Colors.grey,
                                          text: (index + 1).toString(),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Description',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white.withOpacity(0.8),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Text(
                                  state['blurb'],
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        child: Container(
                          width: double.maxFinite,
                          height: 360,
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${state['id']}_${state['skins'][controller.selectedIndex]['num']}.jpg',
                            httpHeaders: const {
                              HttpHeaders.authorizationHeader:
                                  AppCredentials.apiKey,
                            },
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: Image.asset(
                                'assets/gif/league-of-flutter-loading-image.gif',
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                                width: double.maxFinite,
                                height: double.maxFinite,
                              ),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 20,
                        child: Container(
                          height: 360,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Color(0xFF040316),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 340,
                        height: 55,
                        child: Container(
                          width: 240,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFF9b455f),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 330,
                        right: 25,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              child: SvgPicture.asset(
                                'assets/roles/${state['tags'][0].toLowerCase()}.svg',
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${state['tags'][0]}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 70,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                Get.back();
                              },
                              icon: const Icon(Icons.arrow_back),
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: 340,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  child: const Text(
                                    "Difficulty",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.maxFinite,
                                  height: 30,
                                  child: ListView.builder(
                                      itemCount: 5,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (_, index) {
                                        return index >
                                                state['info']['difficulty']
                                            ? const Icon(
                                                Icons.star_border,
                                                color: Colors.white,
                                                size: 15,
                                              )
                                            : const Icon(
                                                Icons.star,
                                                color: Colors.white,
                                                size: 15,
                                              );
                                      }),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 22),
                                  child: const Text(
                                    "Attack",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.maxFinite,
                                  height: 20,
                                  child: ListView.builder(
                                      itemCount: 5,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (_, index) {
                                        return index > state['info']['attack']
                                            ? const Icon(
                                                Icons.star_border,
                                                color: Colors.white,
                                                size: 15,
                                              )
                                            : const Icon(
                                                Icons.star,
                                                color: Colors.white,
                                                size: 15,
                                              );
                                      }),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 200,
                        left: 10,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Text(
                                '${state['name']}',
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${state['title']}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 260,
                        left: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              width: 40,
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://ddragon.leagueoflegends.com/cdn/12.1.1/img/passive/${state['passive']['image']['full']}",
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              child: ListView.builder(
                                  itemCount: state['spells'].length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, index) {
                                    return Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: ClipOval(
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              "https://ddragon.leagueoflegends.com/cdn/12.1.1/img/spell/${state['spells'][index]['image']['full']}",
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        bottom: 20,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SkinsButtons(
                                size: 60,
                                color: Colors.black.withOpacity(0.8),
                                backgroundColor: Colors.white,
                                borderColor: Colors.grey,
                                isIcon: true,
                                icon: Icons.home_outlined,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              SkinsButtons(
                                size: 60,
                                color: Colors.black.withOpacity(0.8),
                                backgroundColor: Colors.white,
                                borderColor: Colors.grey,
                                isIcon: true,
                                icon: Icons.bar_chart_outlined,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
          onError: (e) {
            return Center(
              child: Text(e.toString()),
            );
          },
          onLoading: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color(0xFF010116),
            child: Center(
              child: Image.asset(
                'assets/gif/league-of-flutter-loading-alistar.gif',
                height: 200,
                width: 200,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
