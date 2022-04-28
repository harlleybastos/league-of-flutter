import 'package:initial_app/models/summoner_match.dart';

class SummonerPlainDetails {
  int? championId;
  int? championLevel;
  int? championPoints;
  int? lastPlayTime;
  int? championPointsSinceLastLevel;
  int? championPointsUntilNextLevel;
  bool? chestGranted;
  int? tokensEarned;
  String? summonerId;
  List<SummonerMatch> matchHistory;

  SummonerPlainDetails(
      {required this.matchHistory,
      this.championId,
      this.championLevel,
      this.championPoints,
      this.lastPlayTime,
      this.championPointsSinceLastLevel,
      this.championPointsUntilNextLevel,
      this.chestGranted,
      this.tokensEarned,
      this.summonerId});

  factory SummonerPlainDetails.fromJson(
      Map<String, dynamic> json, List<SummonerMatch> matchHistory) {
    return SummonerPlainDetails(
      championId: json['championId'],
      championLevel: json['championLevel'],
      championPoints: json['championPoints'],
      lastPlayTime: json['lastPlayTime'],
      championPointsSinceLastLevel: json['championPointsSinceLastLevel'],
      championPointsUntilNextLevel: json['championPointsUntilNextLevel'],
      chestGranted: json['chestGranted'],
      tokensEarned: json['tokensEarned'],
      summonerId: json['summonerId'],
      matchHistory: matchHistory,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['championId'] = championId;
    data['championLevel'] = championLevel;
    data['championPoints'] = championPoints;
    data['lastPlayTime'] = lastPlayTime;
    data['championPointsSinceLastLevel'] = championPointsSinceLastLevel;
    data['championPointsUntilNextLevel'] = championPointsUntilNextLevel;
    data['chestGranted'] = chestGranted;
    data['tokensEarned'] = tokensEarned;
    data['summonerId'] = summonerId;
    data['matchHistory'] = matchHistory;
    return data;
  }
}
