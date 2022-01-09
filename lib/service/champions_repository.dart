import 'dart:convert';
import 'dart:io';
import 'package:initial_app/credentials/app_credentials.dart';
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
              AppCredentials.ApiKey,
        });
    final Map<String, dynamic> responseList = jsonDecode(response.body)['data'];
    final List<Map<String, dynamic>> item = [];
    responseList.keys.forEach((key) {
      item.add(responseList[key]);
    });
    return item;
  }
}
