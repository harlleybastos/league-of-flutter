
class Champion {
  final String id;
  final String name;
  final String title;
  final String blurb;
  final String image;
  final ChampionStats stats;
  List<ChampionSkin>? skins;

  Champion({
    required this.id,
    required this.name,
    required this.title,
    required this.blurb,
    required this.image,
    required this.stats,
  });

  factory Champion.fromJson(Map<String, dynamic> json) {
    return Champion(
      id: json['id'],
      name: json['name'],
      title: json['title'],
      blurb: json['blurb'],
      image:
          '${'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/'}${json['id'] ?? ''}_0.jpg',
      stats: ChampionStats.formJson(json['stats']),
    );
  }
}

class ChampionSkin {
  final String? champion;
  final String id;
  final String name;
  final int num;
  final String splashImage;
  final String loadingImage;

  ChampionSkin({
    this.champion,
    required this.id,
    required this.name,
    required this.num,
    required this.splashImage,
    required this.loadingImage,
  });

  factory ChampionSkin.fromJson(Map<String, dynamic> json) {
    return ChampionSkin(
      id: json['id'],
      num: json['num'],
      name: json['name'],
      splashImage:
          '${'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/'}${json['champion']}_${json['num']}.jpg',
      loadingImage:
          '${'http://ddragon.leagueoflegends.com/cdn/img/champion/loading/'}${json['champion']}_${json['num']}.jpg',
    );
  }
}

class ChampionStats {
  final String hp;
  final String hpPerLevel;
  final String mp;
  final String mpPerLevel;
  final String moveSpeed;
  final String armor;
  final String armorPerLevel;
  final String spellBlock;
  final String spellBlockPerLevel;
  final String attackRange;
  final String hpRegen;
  final String hpRegenPerLevel;
  final String mpRegen;
  final String mpRegenPerLevel;
  final String crit;
  final String critPerLevel;
  final String attackDamage;
  final String attactDamagePerLevel;
  final String attackSpeedPerLevel;
  final String attackSpeed;

  ChampionStats({
    required this.hp,
    required this.hpPerLevel,
    required this.mp,
    required this.mpPerLevel,
    required this.moveSpeed,
    required this.armor,
    required this.armorPerLevel,
    required this.spellBlock,
    required this.spellBlockPerLevel,
    required this.attackRange,
    required this.hpRegen,
    required this.hpRegenPerLevel,
    required this.mpRegen,
    required this.mpRegenPerLevel,
    required this.crit,
    required this.critPerLevel,
    required this.attackDamage,
    required this.attactDamagePerLevel,
    required this.attackSpeedPerLevel,
    required this.attackSpeed,
  });

  factory ChampionStats.formJson(json) {
    return ChampionStats(
        hp: json['hp'].toString(),
        hpPerLevel: json['hpperlevel'].toString(),
        mp: json['mp'].toString(),
        mpPerLevel: json['mpperlevel'].toString(),
        moveSpeed: json['movespeed'].toString(),
        armor: json['armor'].toString(),
        armorPerLevel: json['armorperlevel'].toString(),
        spellBlock: json['spellblack'].toString(),
        spellBlockPerLevel: json['spellblockperlevel'].toString(),
        attackRange: json['attackrange'].toString(),
        hpRegen: json['hpregen'].toString(),
        hpRegenPerLevel: json['hpregenperlevel'].toString(),
        mpRegen: json['mpregen'].toString(),
        mpRegenPerLevel: json['mpregenperlevel'].toString(),
        crit: json['crit'].toString(),
        critPerLevel: json['critperlevel'].toString(),
        attackDamage: json['attackdamage'].toString(),
        attactDamagePerLevel: json['attackdamageperlevel'].toString(),
        attackSpeedPerLevel: json['attackspeedperlevel'].toString(),
        attackSpeed: json['attackspeed'].toString());
  }
}
