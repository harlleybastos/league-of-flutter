import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:initial_app/credentials/app_credentials.dart';
import 'package:initial_app/widgets/champion_gradient_background.dart';
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

  Future<Map<String, dynamic>> listAllSkins(String championName) async {
    final response = await http.get(
        Uri.parse(
            'https://ddragon.leagueoflegends.com/cdn/12.1.1/data/en_US/champion/${championName}.json'),
        headers: {
          HttpHeaders.authorizationHeader: AppCredentials.ApiKey,
        });
    final Map<String, dynamic> responseList =
        jsonDecode(response.body)['data'][championName];
    return responseList;
  }

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
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
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
              top: 0,
              left: 0,
              right: 0,
              bottom: 40,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent,
                      ],
                    )),
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
              top: 260,
              left: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
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
                  color: Colors.white,
                ),
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${championData['name']}',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '${championData['tags'][0]}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              championData['tags'].length == 2
                                  ? Text(
                                      '${championData['tags'][1]}',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : Container(),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ]),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${championData['title']}',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Skins',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black.withOpacity(0.8),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Number of Skins of this champion',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.5),
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
