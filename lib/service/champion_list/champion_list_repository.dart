import 'dart:io';

import 'package:initial_app/credentials/app_credentials.dart';
import 'package:initial_app/models/champion.dart';
import 'package:initial_app/repository/i_champions_repository.dart';
import 'package:initial_app/shared/rest_client.dart';

class ChampionListRepository implements IChampionsRepository {
  final RestClient restClient;

  ChampionListRepository(this.restClient);

  @override
  Future<List<Champion>> listAllChampions(
      String version, String language) async {
    final response = await restClient.get(
        'http://ddragon.leagueoflegends.com/cdn/$version/data/$language/champion.json',
        headers: {
          HttpHeaders.authorizationHeader: AppCredentials.apiKey,
        }, decoder: (body) {
      List<Champion> champions = [];
      body['data'].forEach((champion) {
        champions.add(Champion.fromJson(champion));
      });
      return champions;
    });

    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return response.body!;
  }
}
