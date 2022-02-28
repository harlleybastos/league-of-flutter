import 'package:initial_app/models/summoner.dart';

abstract class ISearchSummonerRepository {
  Future<List<Summoner>> getSummonerByName(String name);
}
