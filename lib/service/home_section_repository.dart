import 'dart:convert';

import 'package:initial_app/credentials/app_credentials.dart';
import 'package:initial_app/repository/i_home_section_repository.dart';
import 'package:http/http.dart' as http;

class HomeSectionRepository implements IHomeSectionRepository {
  @override
  Future<List<String>> getDetailsOfSummoner(
      String summonerPuuid, String accountId) async {
    final urlList = [
      'https://americas.api.riotgames.com/lol/match/v5/matches/by-puuid/$summonerPuuid/ids?start=0&count=20',
      'https://br1.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-summoner/$accountId'
    ];

    final responses = await Future.wait(
      urlList.map(
        (url) async => await http.get(
          Uri.parse(url),
          headers: {
            'X-Riot-Token': AppCredentials.apiKey,
            "Origin": "https://developer.riotgames.com",
          },
        ),
      ),
    );

    var finalRespose = responses[0].body;

    List<String> listOfMatches = [];
    List<Map<String, dynamic>> last20MatchesOfSummonerDetailed = [];

    print(responses[1].body);

    if (responses[0].statusCode == 200) {
      listOfMatches = finalRespose.isNotEmpty
          ? (jsonDecode(finalRespose) as List<dynamic>)
              .map((e) => e.toString())
              .toList()
          : [];

      final responseOfAllLast20Matches = await Future.wait(listOfMatches.map(
          (element) async => await http.get(
                  Uri.parse(
                      'https://americas.api.riotgames.com/lol/match/v5/matches/$element'),
                  headers: {
                    "X-Riot-Token": AppCredentials.apiKey,
                    "Origin": "https://developer.riotgames.com",
                  })));

      last20MatchesOfSummonerDetailed.addAll(responseOfAllLast20Matches
          .map((element) => jsonDecode(element.body) as Map<String, dynamic>));
      return listOfMatches;
    }

    return listOfMatches;
  }
}
