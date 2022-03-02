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
    final response = await http.get(
        Uri.parse(
            'https://br1.api.riotgames.com/lol/league/v4/entries/by-summoner/$summonerId'),
        headers: {
          "X-Riot-Token": AppCredentials.apiKey,
          "Origin": "https://developer.riotgames.com",
        });
    final responseTwo = await http.get(
        Uri.parse(
            'https://br1.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-summoner/$summonerId'),
        headers: {
          "X-Riot-Token": AppCredentials.apiKey,
          "Origin": "https://developer.riotgames.com",
        });
    Map<String, dynamic> responseList = jsonDecode(response.body)[0];
    int championId = jsonDecode(responseTwo.body)[0]['championId'];
    List<SummonerDetails> summonerDetails = [];
    summonerDetails.add(SummonerDetails.fromJson(responseList, championId));

    return summonerDetails;
  }
}
