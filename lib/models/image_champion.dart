import 'dart:convert';

class ImageChampion {
  String full;
  String sprite;
  String group;
  String x;
  String y;
  String w;
  String h;
  ImageChampion({
    this.full,
    this.sprite,
    this.group,
    this.x,
    this.y,
    this.w,
    this.h,
  });

  Map<String, dynamic> toMap() {
    return {
      'full': full,
      'sprite': sprite,
      'group': group,
      'x': x,
      'y': y,
      'w': w,
      'h': h,
    };
  }

  factory ImageChampion.fromMap(Map<String, dynamic> map) {
    return ImageChampion(
      full: map['full'] ?? '',
      sprite: map['sprite'] ?? '',
      group: map['group'] ?? '',
      x: map['x'] ?? '',
      y: map['y'] ?? '',
      w: map['w'] ?? '',
      h: map['h'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageChampion.fromJson(String source) => ImageChampion.fromMap(json.decode(source));
}
