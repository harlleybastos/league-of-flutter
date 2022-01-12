import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:initial_app/credentials/app_credentials.dart';
import 'package:initial_app/widgets/skins_buttons.dart';
import 'package:http/http.dart' as http;

class ChampionDetails extends StatefulWidget {
  @override
  State<ChampionDetails> createState() => _ChampionDetailsState();
}

class _ChampionDetailsState extends State<ChampionDetails> {
  int selectedIndex = 0;
  int championSkins = 0;
  String championName = "";
  Map<String, dynamic> championData = {};
  Map<String, dynamic> resp = {};
  List<dynamic> championSkinsList = [];
  List<dynamic> championSpeels = [];
  String championPassiveName = '';

  @override
  void initState() {
    super.initState();
    championPassiveName = Get.arguments['championPassive'];
    championData = Get.arguments['championData'];
    championSkins = Get.arguments['championSkinsLength'];
    championSkinsList = Get.arguments['championListSkins'];
    championSpeels = Get.arguments['championSpells'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
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
                    Text(
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
                      decoration: BoxDecoration(
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
                    Text(
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
                      physics: BouncingScrollPhysics(),
                      child: Wrap(
                        children: List.generate(championSkins, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                right: 10,
                              ),
                              child: SkinsButtons(
                                size: 50,
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor: selectedIndex == index
                                    ? Colors.black
                                    : Colors.grey,
                                borderColor: selectedIndex == index
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
                        color: Colors.black.withOpacity(0.8),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${championData['blurb']}',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.5),
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${championData['id']}_${championSkinsList[selectedIndex]}.jpg',
                      headers: {
                        HttpHeaders.authorizationHeader: AppCredentials.ApiKey,
                      },
                    ),
                    fit: BoxFit.cover,
                  ),
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
              child: Container(
                height: 55,
                width: 240,
                decoration: BoxDecoration(
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
                      'assets/${championData['tags'][0].toLowerCase()}.svg',
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${championData['tags'][0]}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
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
                    onPressed: () => Get.back(),
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
                        child: Text(
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
                              return index > championData['info']['difficulty']
                                  ? Icon(
                                      Icons.star_border,
                                      color: Colors.white,
                                      size: 15,
                                    )
                                  : Icon(
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
                        child: Text(
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
                              return index > championData['info']['attack']
                                  ? Icon(
                                      Icons.star_border,
                                      color: Colors.white,
                                      size: 15,
                                    )
                                  : Icon(
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
                      '${championData['name']}',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${championData['title']}',
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
                            "https://ddragon.leagueoflegends.com/cdn/12.1.1/img/passive/${championPassiveName}",
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: ListView.builder(
                        itemCount: championSpeels.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return Container(
                            padding: EdgeInsets.only(left: 10),
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://ddragon.leagueoflegends.com/cdn/12.1.1/img/spell/${championSpeels[index]['image']['full']}",
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
        ),
      ),
    );
  }
}
