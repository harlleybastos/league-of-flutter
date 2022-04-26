import 'package:get/get.dart';
import '../models/summoner_details.dart';

class SummonerDetailsController extends GetxController with StateMixin {
  SummonerDetails? summonerDetails;
  String summonerMainChampionSkin = '';

  @override
  void onInit() {
    summonerDetails = Get.arguments['summonerData'];
    summonerMainChampionSkin = Get.arguments['summonerMainChampionSkin'];
    super.onInit();
  }
}
