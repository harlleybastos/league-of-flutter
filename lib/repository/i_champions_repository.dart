import 'package:initial_app/models/champion_data_model.dart';

abstract class IChampionsRepository{
  Future<Map<String,dynamic>> listAllChampions();
}