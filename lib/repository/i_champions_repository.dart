import 'package:initial_app/models/champion.dart';

abstract class IChampionsRepository {
  Future<List<Champion>> listAllChampions();
}
