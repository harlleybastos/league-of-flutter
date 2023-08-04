import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:league_of_flutter/models/summoner.dart';
import 'package:league_of_flutter/repository/i_search_summoner_repository.dart';
import 'package:http/http.dart' as http;

class SearchSummonerRepository implements ISearchSummonerRepository {
  @override
  Future<List<Summoner>> getSummonerByName(String name) async {
    if (name.contains(" ")) {
      name = name.replaceAll(" ", "%20");
    }
    final response = await http.get(
        Uri.parse(
            'https://br1.api.riotgames.com/lol/summoner/v4/summoners/by-name/$name'),
        headers: {
          "X-Riot-Token": dotenv.env['RIOT_API']!,
          "Origin": "https://developer.riotgames.com",
        });
    Map<String, dynamic> responseList = jsonDecode(response.body);

    List<Summoner> summonerList = [];
    summonerList.add(Summoner.fromJson(responseList));

    return summonerList;
  }
}
