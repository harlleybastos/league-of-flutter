import 'package:league_of_flutter/models/summoner_details.dart';

abstract class ISearchSummonerWithDetailsRepository {
  Future<List<SummonerDetails>> getSummonerDetailsByName(
      String summonerId, String accountId);
}
