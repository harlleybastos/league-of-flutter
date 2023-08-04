import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:league_of_flutter/repository/i_initial_screen.dart';
import 'package:http/http.dart' as http;

class InitialScreenRepository implements IInitialScreenRepository {
  @override
  Future<String> getLatestVersionOfApi() async {
    final response = await http.get(
        Uri.parse('https://ddragon.leagueoflegends.com/api/versions.json'),
        headers: {
          HttpHeaders.authorizationHeader: dotenv.env['RIOT_API']!,
        });
    String latestVersion = jsonDecode(response.body)[0];
    return latestVersion;
  }
}
