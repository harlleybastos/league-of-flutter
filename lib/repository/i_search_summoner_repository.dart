import 'package:league_of_flutter/models/summoner.dart';

abstract class ISearchSummonerRepository {
  Future<List<Summoner>> getSummonerByName(String name);
}
