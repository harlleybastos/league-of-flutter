abstract class IChampionDetailsRepository {
  Future<Map<String, dynamic>> getChampionDetails(
      String championId, String language, String version);
}
