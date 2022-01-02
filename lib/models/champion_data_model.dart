import 'dart:convert';

import 'package:initial_app/models/champion.dart';

class ChampionDataModel {
  String name;
  List<Champion> champions;

  ChampionDataModel({
     this.name,
     this.champions,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'champions': champions.map((x) => x.toMap()).toList(),
    };
  }

  factory ChampionDataModel.fromMap(Map<String, dynamic> map) {
    return ChampionDataModel(
      name: map['name'] ?? '',
      champions: List<Champion>.from(map['champions']?.map((x) => Champion.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChampionDataModel.fromJson(String source) => ChampionDataModel.fromMap(json.decode(source));
}
