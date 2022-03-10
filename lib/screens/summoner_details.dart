import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../widgets/SummonerDetails/positioned_gradient_for_summoner_level.dart';
import '../widgets/SummonerDetails/positioned_gradient_for_summoner_win.dart';
import '../widgets/SummonerDetails/positioned_gradient_for_summoner_loses.dart';
import '../widgets/SummonerDetails/positioned_gradient_for_summoner_rank.dart';
import '../widgets/SummonerDetails/positioned_summoner_level.dart';
import '../widgets/SummonerDetails/positioned_summoner_losses.dart';
import '../widgets/SummonerDetails/positioned_summoner_wins.dart';

import '../controller/summoner_details_controller.dart';

import '../widgets/SummonerDetails/positioned_summoner_icon.dart';
import '../widgets/SummonerDetails/positioned_summoner_league_points.dart';
import '../widgets/SummonerDetails/positioned_summoner_rank.dart';
import '../widgets/SummonerDetails/postioned_gradient_for_summoner_name.dart';
import '../widgets/SummonerDetails/postioned_main_champion_gradient.dart';
import '../widgets/SummonerDetails/postioned_main_champion_image.dart';
import '../widgets/SummonerDetails/postioned_summoner_name.dart';

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
                const PositionedGradientForSummonerRank(),
                PositionedSummonerLeaguePoints(
                    leaguePoints:
                        "${controller.summonerDetails!.tier.toString()} ${controller.summonerDetails!.rank}"),
                PositionedSummonerIcon(
                    summonerIconUrl:
                        'http://ddragon.leagueoflegends.com/cdn/12.5.1/img/profileicon/${controller.summonerDetails?.profileIconNumber}.png'),
                const PositionedGradientForSummonerWins(),
                PositionedSummonerWins(
                  wins: controller.summonerDetails!.wins.toString(),
                ),
                const PositionedGradientForSummonerLosses(),
                PositionedSummonerLosses(
                  losses: controller.summonerDetails!.losses.toString(),
                ),
                const PositionedGradientForSummonerLevel(),
                PositionedSummonerLevel(
                  level: controller.summonerDetails!.level.toString(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
