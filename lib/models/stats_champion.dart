import 'dart:convert';

class StatsChange {
  int hp;
  int hpperlevel;
  int mp;
  int mpperlevel;
  int movespeed;
  int armor;
  double armorperlevel;
  int spellblock;
  double spellblockperlevel;
  int attackrange;
  int hpregen;
  int hpregenperlevel;
  int mpregen;
  int mpregenperlevel;
  double crit;
  double critperlevel;
  double attackdamage;
  double attackdamageperlevel;
  double attackspeedperlevel;
  double attackspeed;
  StatsChange({
     required this.hp,
     required this.hpperlevel,
     required this.mp,
     required this.mpperlevel,
     required this.movespeed,
     required this.armor,
     required this.armorperlevel,
     required this.spellblock,
     required this.spellblockperlevel,
     required this.attackrange,
     required this.hpregen,
     required this.hpregenperlevel,
     required this.mpregen,
     required this.mpregenperlevel,
     required this.crit,
     required this.critperlevel,
     required this.attackdamage,
     required this.attackdamageperlevel,
     required this.attackspeedperlevel,
     required this.attackspeed,
  });

  


  Map<String, dynamic> toMap() {
    return {
      'hp': hp,
      'hpperlevel': hpperlevel,
      'mp': mp,
      'mpperlevel': mpperlevel,
      'movespeed': movespeed,
      'armor': armor,
      'armorperlevel': armorperlevel,
      'spellblock': spellblock,
      'spellblockperlevel': spellblockperlevel,
      'attackrange': attackrange,
      'hpregen': hpregen,
      'hpregenperlevel': hpregenperlevel,
      'mpregen': mpregen,
      'mpregenperlevel': mpregenperlevel,
      'crit': crit,
      'critperlevel': critperlevel,
      'attackdamage': attackdamage,
      'attackdamageperlevel': attackdamageperlevel,
      'attackspeedperlevel': attackspeedperlevel,
      'attackspeed': attackspeed,
    };
  }

  factory StatsChange.fromMap(Map<String, dynamic> map) {
    return StatsChange(
      hp: map['hp']?.toInt() ?? 0,
      hpperlevel: map['hpperlevel']?.toInt() ?? 0,
      mp: map['mp']?.toInt() ?? 0,
      mpperlevel: map['mpperlevel']?.toInt() ?? 0,
      movespeed: map['movespeed']?.toInt() ?? 0,
      armor: map['armor']?.toInt() ?? 0,
      armorperlevel: map['armorperlevel']?.toDouble() ?? 0.0,
      spellblock: map['spellblock']?.toInt() ?? 0,
      spellblockperlevel: map['spellblockperlevel']?.toDouble() ?? 0.0,
      attackrange: map['attackrange']?.toInt() ?? 0,
      hpregen: map['hpregen']?.toInt() ?? 0,
      hpregenperlevel: map['hpregenperlevel']?.toInt() ?? 0,
      mpregen: map['mpregen']?.toInt() ?? 0,
      mpregenperlevel: map['mpregenperlevel']?.toInt() ?? 0,
      crit: map['crit']?.toDouble() ?? 0.0,
      critperlevel: map['critperlevel']?.toDouble() ?? 0.0,
      attackdamage: map['attackdamage']?.toDouble() ?? 0.0,
      attackdamageperlevel: map['attackdamageperlevel']?.toDouble() ?? 0.0,
      attackspeedperlevel: map['attackspeedperlevel']?.toDouble() ?? 0.0,
      attackspeed: map['attackspeed']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory StatsChange.fromJson(String source) => StatsChange.fromMap(json.decode(source));
}
