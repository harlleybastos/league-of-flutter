import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:initial_app/controller/summoner_details_controller.dart';
import 'package:initial_app/widgets/SummonerDetails/positioned_summoner_icon.dart';
import 'package:initial_app/widgets/SummonerDetails/positioned_summoner_league_points.dart';
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
                  left: 0,
                  bottom: MediaQuery.of(context).size.height * 0.10,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Container(
                    width: 240,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color.fromARGB(255, 6, 133, 155),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                PositionedSummonerLeaguePoints(
                    leaguePoints:
                        "${controller.summonerDetails!.tier.toString()} ${controller.summonerDetails!.rank}"),
                PositionedSummonerIcon(
                    summonerIconUrl:
                        'http://ddragon.leagueoflegends.com/cdn/12.5.1/img/profileicon/${controller.summonerDetails?.profileIconNumber}.png'),
                Positioned(
                  right: 0,
                  left: MediaQuery.of(context).size.width * 0.75,
                  bottom: MediaQuery.of(context).size.height * 0.20,
                  top: MediaQuery.of(context).size.height * 0.70,
                  child: Container(
                    height: 350,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color.fromARGB(255, 6, 155, 98),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 25,
                  top: MediaQuery.of(context).size.height * 0.74,
                  child: Container(
                    child: Center(
                      child: Text(
                        controller.summonerDetails!.wins.toString(),
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: MediaQuery.of(context).size.height * 0.80,
                  bottom: MediaQuery.of(context).size.height * 0.10,
                  left: MediaQuery.of(context).size.width * 0.75,
                  child: Container(
                    height: 350,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color.fromARGB(255, 155, 6, 26),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 25,
                  top: MediaQuery.of(context).size.height * 0.84,
                  child: Container(
                    child: Center(
                      child: Text(
                        controller.summonerDetails!.losses.toString(),
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  left: MediaQuery.of(context).size.width * 0.45,
                  bottom: MediaQuery.of(context).size.height * 0.32,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Container(
                    width: 240,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          Color.fromARGB(255, 155, 73, 6),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 50,
                  top: MediaQuery.of(context).size.height * 0.62,
                  child: Container(
                    child: Center(
                      child: Text(
                        controller.summonerDetails!.level.toString(),
                        style: const TextStyle(
                          fontSize: 25,
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
