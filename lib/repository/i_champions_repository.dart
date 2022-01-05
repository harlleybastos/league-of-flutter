abstract class IChampionsRepository{
  Future<List<Map<String,dynamic>>> listAllChampions();
  Future<Map<String,dynamic>> listAllSkins(String championName);
}