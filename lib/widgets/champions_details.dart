import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:initial_app/widgets/skins_buttons.dart';
import 'package:http/http.dart' as http;

class ChampionDetails extends StatefulWidget {
  @override
  State<ChampionDetails> createState() => _ChampionDetailsState();
}

class _ChampionDetailsState extends State<ChampionDetails> {
  int selectedIndex = -1;
  int championSkins = 0;
  String championName = "";
  Map<String, dynamic> championData = {};
  Map<String,dynamic> resp = {};


  Future<Map<String, dynamic>> listAllSkins(String championName) async {
    final response = await http.get(
        Uri.parse(
            'https://ddragon.leagueoflegends.com/cdn/12.1.1/data/en_US/champion/${championName}.json'),
        headers: {
          HttpHeaders.authorizationHeader:
              'RGAPI-6ae13d4d-c696-4f59-8716-a8258652870a',
        });
    final Map<String, dynamic> responseList =
        jsonDecode(response.body)['data'][championName];
    return responseList;
  }
@override
  void initState() {
    super.initState();
    championData = Get.arguments['championData'];
    championSkins = Get.arguments['championSkins'];
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
                decoration:  BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${championData['id']}_0.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
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
                            children: const [
                              Text(
                                'Fighter',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Tank',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                    Wrap(
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
                      'Aatrox is a legendary warrior, one of only five that remain of an ancient',
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
