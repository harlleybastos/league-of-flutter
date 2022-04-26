import 'package:initial_app/models/summoner_plain_details.dart';

abstract class IHomeSectionRepository {
  Future<List<SummonerPlainDetails>> getDetailsOfSummoner(
      String summonerPuuid, String accountId);
}
