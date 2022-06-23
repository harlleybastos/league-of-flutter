import 'dart:convert';

import 'package:initial_app/credentials/app_credentials.dart';
import 'package:initial_app/models/summoner_match.dart';
import 'package:initial_app/models/summoner_plain_details.dart';
import 'package:initial_app/repository/i_home_section_repository.dart';
import 'package:http/http.dart' as http;

class HomeSectionRepository implements IHomeSectionRepository {
  @override
  Future<List<SummonerPlainDetails>> getDetailsOfSummoner(
      String summonerPuuid, String accountId) async {
    List<String> listOfMatches = [];
    List<SummonerMatch> last20MatchesOfSummonerDetailed = [];
    List<SummonerPlainDetails> summonerPlainDetails = [];

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
          .map((element) => SummonerMatch.fromJson(jsonDecode(element.body))));

      summonerPlainDetails = responses[1].body.isNotEmpty
          ? (jsonDecode(responses[1].body) as List<dynamic>)
              .map((e) => SummonerPlainDetails.fromJson(
                  e, last20MatchesOfSummonerDetailed))
              .toList()
          : [];

      return summonerPlainDetails;
    }

    return summonerPlainDetails;
  }
}
