import 'package:league_of_flutter/models/champion.dart';

abstract class IChampionsRepository {
  Future<List<Champion>> listAllChampions(String version, String language);
}
