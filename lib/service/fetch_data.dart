import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:initial_app/models/champion.dart';

Future<List<Champion>> fetchChampions() async {
  var response = await http.get(Uri.parse(
      'http://ddragon.leagueoflegends.com/cdn/10.5.1/data/en_US/champion.json'));
  var jsonResponse = jsonDecode(response.body);

  Map<String, dynamic> data = jsonResponse['data'];

  List<Champion> result = [];

  data.forEach((champion, data) {
    result.add(Champion.fromJson(data));
  });

  return result;
}
