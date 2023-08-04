import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:league_of_flutter/models/champion.dart';
import 'package:league_of_flutter/repository/i_champions_repository.dart';
import 'package:league_of_flutter/shared/rest_client.dart';

class ChampionListRepository implements IChampionsRepository {
  final RestClient restClient;

  ChampionListRepository(this.restClient);

  @override
  Future<List<Champion>> listAllChampions(
      String version, String language) async {
    final response = await restClient.get(
        'http://ddragon.leagueoflegends.com/cdn/$version/data/$language/champion.json',
        headers: {
          HttpHeaders.authorizationHeader: dotenv.env['RIOT_API']!,
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
