import 'dart:convert';
import 'dart:io';
import 'package:initial_app/models/champion.dart';
import 'package:initial_app/models/champion_data_model.dart';
import 'package:initial_app/repository/i_champions_repository.dart';
import 'package:http/http.dart' as http;

class ChampionsHttpRepository implements IChampionsRepository{
  @override
  Future<Map<String,dynamic>>listAllChampions() async {
    final response = await http.get('http://ddragon.leagueoflegends.com/cdn/10.5.1/data/en_US/champion.json',headers: {
      HttpHeaders.authorizationHeader:'RGAPI-88af2c5b-7e5d-4ac4-8a08-22bff0b758ba',
    });
    final Map<String,dynamic> responseList = jsonDecode(response.body)['data'];
    return responseList;
  }

}