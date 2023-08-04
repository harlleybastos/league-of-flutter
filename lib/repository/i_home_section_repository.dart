import 'package:league_of_flutter/models/summoner_plain_details.dart';

abstract class IHomeSectionRepository {
  Future<List<SummonerPlainDetails>> getDetailsOfSummoner(
      String summonerPuuid, String accountId);
}
