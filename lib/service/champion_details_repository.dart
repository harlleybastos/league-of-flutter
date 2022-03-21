import 'dart:convert';
import 'dart:io';

import 'package:initial_app/credentials/app_credentials.dart';
import 'package:initial_app/repository/i_champion_details_repository.dart';
import 'package:http/http.dart' as http;

class ChampionDetailsRepository implements IChampionDetailsRepository {
  @override
  Future<Map<String, dynamic>> getChampionDetails(String championName, String language, String version) async {
    final response = await http.get(
        Uri.parse(
            'https://ddragon.leagueoflegends.com/cdn/$version/data/$language/champion/$championName.json'),
        headers: {
          HttpHeaders.authorizationHeader: AppCredentials.apiKey,
        });
    final Map<String, dynamic> responseList =
        jsonDecode(response.body)['data'][championName];
    return responseList;
  }
}
