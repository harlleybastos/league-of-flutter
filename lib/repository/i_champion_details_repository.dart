abstract class IChampionDetailsRepository{
  Future<Map<String,dynamic>> getChampionDetails(String championId);
}