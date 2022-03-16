import 'dart:convert';
import 'dart:io';

import 'package:initial_app/credentials/app_credentials.dart';
import 'package:initial_app/repository/i_initial_screen.dart';
import 'package:http/http.dart' as http;

class InitialScreenRepository implements IInitialScreenRepository {
  @override
  Future<String> getLatestVersionOfApi() async {
    final response = await http.get(
        Uri.parse('https://ddragon.leagueoflegends.com/api/versions.json'),
        headers: {
          HttpHeaders.authorizationHeader: AppCredentials.apiKey,
        });
    String latestVersion = jsonDecode(response.body)[0];
    return latestVersion;
  }
}
