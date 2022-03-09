class SummonerDetails {
  String leagueId;
  String id;
  String queueType;
  String tier;
  String rank;
  String summonerId;
  String summonerName;
  int leaguePoints;
  bool veteran;
  bool inactive;
  bool freshBlood;
  bool hotStreak;
  int profileIconNumber;
  int wins;
  int losses;
  int championId;
  int level;

  SummonerDetails(
      {required this.level,
      required this.profileIconNumber,
      required this.championId,
      required this.leagueId,
      required this.id,
      required this.queueType,
      required this.tier,
      required this.rank,
      required this.summonerId,
      required this.summonerName,
      required this.leaguePoints,
      required this.wins,
      required this.losses,
      required this.veteran,
      required this.inactive,
      required this.freshBlood,
      required this.hotStreak});

  factory SummonerDetails.fromJson(
      Map<String, dynamic> json,
      Map<String, dynamic> summonerDetailsResponse,
      int profileIconNumber,
      int level) {
    return SummonerDetails(
      leagueId: json['leagueId'] ?? '',
      id: json["id"] ?? '',
      queueType: json["queueType"] ?? '',
      tier: json["tier"] ?? '',
      rank: json["rank"] ?? '',
      summonerId: json["summonerId"] ?? '',
      summonerName: json["summonerName"] ?? '',
      leaguePoints: json["leaguePoints"] ?? 0,
      wins: json["wins"] ?? 0,
      losses: json["losses"] ?? 0,
      veteran: json["veteran"] ?? false,
      inactive: json["inactive"] ?? false,
      freshBlood: json["freshBlood"] ?? false,
      hotStreak: json["hotStreak"] ?? false,
      championId: summonerDetailsResponse['championId'] ?? 0,
      profileIconNumber: profileIconNumber,
      level: level,
    );
  }
}
