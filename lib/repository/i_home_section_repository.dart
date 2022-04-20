abstract class IHomeSectionRepository {
  Future<List<String>> getDetailsOfSummoner(
      String summonerPuuid, String accountId);
}
