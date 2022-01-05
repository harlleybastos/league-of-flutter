import 'dart:convert';
import 'dart:io';
import 'package:initial_app/repository/i_champions_repository.dart';
import 'package:http/http.dart' as http;

class ChampionsHttpRepository implements IChampionsRepository {
  @override
  Future<List<Map<String, dynamic>>> listAllChampions() async {
    final response = await http.get(
        Uri.parse(
            'http://ddragon.leagueoflegends.com/cdn/10.5.1/data/en_US/champion.json'),
        headers: {
          HttpHeaders.authorizationHeader:
              'RGAPI-6ae13d4d-c696-4f59-8716-a8258652870a',
        });
    final Map<String, dynamic> responseList = jsonDecode(response.body)['data'];
    final List<Map<String, dynamic>> item = [];
    responseList.keys.forEach((key) {
      item.add(responseList[key]);
    });
    return item;
  }

  @override
  Future<Map<String,dynamic>> listAllSkins(String championName) async {
    final response = await http.get(
        Uri.parse(
            'https://ddragon.leagueoflegends.com/cdn/12.1.1/data/en_US/champion/${championName}.json'),
        headers: {
          HttpHeaders.authorizationHeader:
              'RGAPI-6ae13d4d-c696-4f59-8716-a8258652870a',
        });
    final Map<String, dynamic> responseList = jsonDecode(response.body)['data'][championName];
    return responseList;
  }
}
