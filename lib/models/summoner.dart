class Summoner {
  String id;
  String accountId;
  String puuid;
  String name;
  int profileIconId;
  int revisionDate;
  int summonerLevel;

  Summoner({
    required this.id,
    required this.accountId,
    required this.puuid,
    required this.name,
    required this.summonerLevel,
    required this.profileIconId,
    required this.revisionDate,
  });

  factory Summoner.fromJson(Map<String, dynamic> json) {
    return Summoner(
      id: json['id'] as String,
      accountId: json['accountId'] as String,
      puuid: json['puuid'] as String,
      name: json['name'] as String,
      summonerLevel: json['summonerLevel'] as int,
      profileIconId: json['profileIconId'] as int,
      revisionDate: json['revisionDate'] as int,
    );
  }
}
