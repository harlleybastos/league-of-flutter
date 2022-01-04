import 'dart:convert';

class InfoChampion {
  String attack;
  String defense;
  String magic;
  String difficulty;

  InfoChampion({
    required this.attack,
    required this.defense,
    required this.magic,
    required this.difficulty,
  });

  Map<String, dynamic> toMap() {
    return {
      'attack': attack,
      'defense': defense,
      'magic': magic,
      'difficulty': difficulty,
    };
  }

  factory InfoChampion.fromMap(Map<String, dynamic> map) {
    return InfoChampion(
      attack: map['attack'] ?? '',
      defense: map['defense'] ?? '',
      magic: map['magic'] ?? '',
      difficulty: map['difficulty'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory InfoChampion.fromJson(String source) => InfoChampion.fromMap(json.decode(source));
}
