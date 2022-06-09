import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:initial_app/models/summoner_match.dart';
import 'package:shimmer/shimmer.dart';

class ConditionalRenderingLastMatches extends StatelessWidget {
  List<SummonerMatch> data = [];
  Function filterChampionList;
  Function changeTypeOfGameMode;

  ConditionalRenderingLastMatches(
      {required this.data,
      required this.filterChampionList,
      required this.changeTypeOfGameMode});

  @override
  Widget build(BuildContext context) {
    return data.isEmpty
        ? Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.50,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Positioned(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.3,
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: double.infinity,
                              height: 180,
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: 3,
            ),
          )
        : Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.55,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            child: ListView.builder(
              itemBuilder: (context, index) {
                Participants summoner =
                    filterChampionList(data[index].info!.participants!);
                String gameMode =
                    changeTypeOfGameMode(data[index].info!.gameMode!);

                return Stack(
                  children: [
                    Positioned(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.3,
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${summoner.championName}_0.jpg',
                            height: MediaQuery.of(context).size.height * 0.6,
                            fit: BoxFit.cover,
                            alignment: const Alignment(0.4, -1),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.25,
                      bottom: 0,
                      top: MediaQuery.of(context).size.height * 0.01,
                      child: Container(
                        color: Colors.transparent,
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: const Color(0xFF00060e),
                              border: Border.all(
                                color: Color(0xFF7f6e3c),
                                width: 1,
                              ),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: Text(
                                "${summoner.champLevel}",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 212, 212, 211),
                                  fontFamily: 'BeaufortForLOL',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.15,
                      bottom: MediaQuery.of(context).size.height * 0.02,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.9),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.2,
                      bottom: MediaQuery.of(context).size.height * 0.1,
                      child: Container(
                        color: Colors.transparent,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.15,
                        ),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            gameMode,
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 243, 236, 219),
                                fontFamily: 'BeaufortForLOL'),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.38,
                      bottom: MediaQuery.of(context).size.height * 0.05,
                      child: Container(
                        color: Colors.transparent,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.15,
                        ),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            summoner.win! ? 'WIN' : 'LOSE',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: summoner.win!
                                    ? const Color(0xFF059ab0).withOpacity(0.9)
                                    : const Color(0xFFee1f3f),
                                fontFamily: 'BeaufortForLOL'),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: MediaQuery.of(context).size.height * 0.25,
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.black.withOpacity(0.9),
                              Colors.transparent,
                            ],
                          ),
                        ),
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.15,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "${summoner.kills}/${summoner.deaths}/${summoner.assists}",
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 243, 236, 219),
                              fontFamily: 'BeaufortForLOL',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: data.length,
            ),
          );
  }
}
