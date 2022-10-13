import 'package:initial_app/repository/i_champion_details_repository.dart';
import 'package:initial_app/shared/rest_client.dart';

class ChampionDetailsRepository implements IChampionDetailsRepository {
  final RestClient restClient;

  ChampionDetailsRepository(this.restClient);

  @override
  Future<Map<String, dynamic>> getChampionDetails(
      String championId, String language, String version) async {
    final response = await restClient.get(
        'https://ddragon.leagueoflegends.com/cdn/$version/data/$language/champion/$championId.json',
        decoder: (body) {
      return body['data'][championId];
    });

    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return response.body;
  }
}
