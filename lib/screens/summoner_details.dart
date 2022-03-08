import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:initial_app/controller/summoner_details_controller.dart';
import 'package:initial_app/widgets/SummonerDetails/positioned_summoner_rank.dart';
import 'package:initial_app/widgets/SummonerDetails/postioned_gradient_for_summoner_name.dart';
import 'package:initial_app/widgets/SummonerDetails/postioned_main_champion_gradient.dart';
import 'package:initial_app/widgets/SummonerDetails/postioned_main_champion_image.dart';
import 'package:initial_app/widgets/SummonerDetails/postioned_summoner_name.dart';

class SummonerDetailsScreen extends StatelessWidget {
  const SummonerDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SummonerDetailsController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                PostionedMainChampionImage(
                  imageUrl: controller.summonerMainChampionSkin,
                ),
                const PositionedMainChampionGradient(),
                PositionedSummonerRank(
                    rankUrl:
                        'assets/ranked-emblems/${controller.summonerDetails!.tier.toLowerCase()}.svg'),
                const PositionedGradientForSummonerName(),
                PositionedSummonerName(
                  summonerName: controller.summonerDetails!.summonerName,
                ),
                Positioned(
                  right: 0,
                  top: MediaQuery.of(context).size.height * 0.62,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Container(
                    width: 200,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          Color(0xFF9b455f),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.only(left: 40),
                    child: Center(
                      child: Text(
                        "${controller.summonerDetails!.leaguePoints.toString()} LP",
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
