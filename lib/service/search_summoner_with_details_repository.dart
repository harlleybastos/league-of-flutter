import 'dart:convert';

import '../credentials/app_credentials.dart';

import '../models/summoner_details.dart';

import '../repository/i_search_summoner_with_details.dart';

import 'package:http/http.dart' as http;

class SearchSummonerWithDetailsRepository
    implements ISearchSummonerWithDetailsRepository {
  @override
  Future<List<SummonerDetails>> getSummonerDetailsByName(
      String summonerId) async {
    final urlList = [
      'https://br1.api.riotgames.com/lol/league/v4/entries/by-summoner/$summonerId',
      'https://br1.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-summoner/$summonerId'
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
    // Get the basic info about the summoner
    Map<String, dynamic> responseList = jsonDecode(responses[0].body)[0];
    // Get the details about the summoner
    int championId = jsonDecode(responses[1].body)[0]['championId'];
    List<SummonerDetails> summonerDetails = [];
    summonerDetails.add(SummonerDetails.fromJson(responseList, championId));

    return summonerDetails;
  }
}
