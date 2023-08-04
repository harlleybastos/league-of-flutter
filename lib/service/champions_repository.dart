import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:league_of_flutter/models/champion.dart';
import 'package:league_of_flutter/repository/i_champions_repository.dart';
import 'package:http/http.dart' as http;

class ChampionsHttpRepository implements IChampionsRepository {
  @override
  Future<List<Champion>> listAllChampions(
      String version, String language) async {
    final response = await http.get(
        Uri.parse(
            'http://ddragon.leagueoflegends.com/cdn/$version/data/$language/champion.json'),
        headers: {
          HttpHeaders.authorizationHeader: dotenv.env['RIOT_API']!,
        });
    Map<String, dynamic> responseList = jsonDecode(response.body)['data'];
    List<Champion> item = [];
    responseList.forEach((key, value) {
      item.add(Champion.fromJson(value));
    });
    return item;
  }
}
