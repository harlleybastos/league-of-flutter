abstract class IHomeSectionRepository {
  Future<List<dynamic>> getLeagueOfLegendsStatus();
  Future<List<int>> getChampionsRotations();
}