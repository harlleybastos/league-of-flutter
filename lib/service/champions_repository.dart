import 'dart:convert';
import 'dart:io';
import 'package:initial_app/credentials/app_credentials.dart';
import 'package:initial_app/models/champion.dart';
import 'package:initial_app/repository/i_champions_repository.dart';
import 'package:http/http.dart' as http;

class ChampionsHttpRepository implements IChampionsRepository {
  @override
  Future<List<Champion>> listAllChampions() async {
    final response = await http.get(
        Uri.parse(
            'http://ddragon.leagueoflegends.com/cdn/12.3.1/data/en_US/champion.json'),
        headers: {
          HttpHeaders.authorizationHeader: AppCredentials.ApiKey,
        });
    Map<String, dynamic> responseList = jsonDecode(response.body)['data'];
    List<Champion> item = [];
    responseList.forEach((key, value) {
      item.add(Champion.fromJson(value));
    });
    return item;
  }
}
