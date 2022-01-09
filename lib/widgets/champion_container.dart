import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:initial_app/credentials/app_credentials.dart';
import 'package:initial_app/widgets/champion_gradient_background.dart';
import 'package:initial_app/widgets/champion_icon.dart';
import 'package:initial_app/widgets/champion_image_background.dart';

class ChampionContainer extends StatelessWidget {
  final Map<String, dynamic> championData;
  int championSkins = 0;

  ChampionContainer({Key? key, required this.championData})
      : super(key: key);

  Future<Map<String, dynamic>> listAllSkins(String championName) async {
    final response = await http.get(
        Uri.parse(
            'https://ddragon.leagueoflegends.com/cdn/12.1.1/data/en_US/champion/${championName}.json'),
        headers: {
          HttpHeaders.authorizationHeader:
              AppCredentials.ApiKey,
        });
    final Map<String, dynamic> responseList =
        jsonDecode(response.body)['data'][championName];
    return responseList;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () async {
        final resp = await listAllSkins(championData['id']);
        int championSkins = resp['skins'].map((skin) => skin['name']).toList().length;
        final championListSkins = resp['skins'].map((skin) => skin['num']).toList();

        Get.toNamed('/champion-details', arguments: {
          'championData': championData,
          'championSkinsLength': championSkins,
          'championListSkins': championListSkins
        });
      },
      child: Container(
        width: size.width,
        height: 200,
        margin: const EdgeInsets.all(20),
        child: Stack(
          children: [
            ChampionImageBackground(
              championName: championData['id'],
            ),
            const ChampionGradientBackground(),
            ChampionIcon(championData),
          ],
        ),
      ),
    );
  }
}
