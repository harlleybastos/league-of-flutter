import 'dart:convert';

import '../credentials/app_credentials.dart';

import '../repository/i_conditional_login_repository.dart';

import 'package:http/http.dart' as http;

class ConditionalLoginRepository implements IConditionalLoginRepository {
  @override
  Future<bool> verifySummonerName(String summonerName) async {
    if (summonerName.contains(" ")) {
      summonerName = summonerName.replaceAll(" ", "%20");
    }
    final response = await http.get(
        Uri.parse(
            'https://br1.api.riotgames.com/lol/summoner/v4/summoners/by-name/$summonerName'),
        headers: {
          "X-Riot-Token": AppCredentials.apiKey,
          "Origin": "https://developer.riotgames.com",
        });
    Map<String, dynamic> responseList = jsonDecode(response.body);
    if (responseList['id'] != null) {
      return true;
    }
    return false;
  }
}
