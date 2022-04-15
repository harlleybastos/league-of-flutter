import 'dart:convert';

import 'package:initial_app/credentials/app_credentials.dart';
import 'package:initial_app/repository/i_home_section_repository.dart';
import 'package:http/http.dart' as http;

class HomeSectionRepository implements IHomeSectionRepository {
  @override
  Future<Map<String, dynamic>> getDetailsOfSummoner(
      String summonerPuuid) async {
    final response = await http.get(
        Uri.parse(
            'https://americas.api.riotgames.com/lol/match/v5/matches/by-puuid/$summonerPuuid/ids'),
        headers: {
          "X-Riot-Token": AppCredentials.apiKey,
          "Origin": "https://developer.riotgames.com",
        });
    Map<String, dynamic> responseList = jsonDecode(response.body);
    print(responseList);
    List<dynamic> finalResult = [];
    responseList.forEach((key, value) {
      print(value);
      finalResult.add(value);
    });
    return responseList;
  }
}
