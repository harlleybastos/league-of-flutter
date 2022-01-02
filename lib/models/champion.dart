import 'dart:convert';

import 'package:initial_app/models/image_champion.dart';
import 'package:initial_app/models/info_champion.dart';
import 'package:initial_app/models/stats_champion.dart';

class Champion {
  String version;
  String id;
  String key;
  String title;
  String blurb;
  List<InfoChampion> info;
  List<ImageChampion> image;
  List<String> tags;
  String partype;
  List<StatsChange> stats;

  Champion({
    this.version,
    this.id,
    this.key,
    this.title,
    this.blurb,
    this.info,
    this.image,
    this.tags,
    this.partype,
    this.stats,
  });

  Map<String, dynamic> toMap() {
    return {
      'version': version,
      'id': id,
      'key': key,
      'title': title,
      'blurb': blurb,
      'info': info.map((x) => x.toMap()).toList(),
      'image': image.map((x) => x.toMap()).toList(),
      'tags': tags,
      'partype': partype,
      'stats': stats.map((x) => x.toMap()).toList(),
    };
  }
 

  factory Champion.fromMap(Map<String, dynamic> map) {
    return Champion(
      version: map['version'] ?? '',
      id: map['id'] ?? '',
      key: map['key'] ?? '',
      title: map['title'] ?? '',
      blurb: map['blurb'] ?? '',
      info: List<InfoChampion>.from(map['info']?.map((x) => InfoChampion.fromMap(x))),
      image: List<ImageChampion>.from(map['image']?.map((x) => ImageChampion.fromMap(x))),
      tags: List<String>.from(map['tags']),
      partype: map['partype'] ?? '',
      stats: List<StatsChange>.from(map['stats']?.map((x) => StatsChange.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Champion.fromJson(String source) => Champion.fromMap(json.decode(source));
}
