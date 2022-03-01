import 'package:initial_app/models/summoner_details.dart';

abstract class ISearchSummonerWithDetailsRepository {
  Future<List<SummonerDetails>> getSummonerDetailsByName(String summonerId);
}
