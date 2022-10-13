// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:flutter/foundation.dart';

// import 'package:initial_app/models/champion_info.dart';

// class ChampionDetailModel {
//   String type;
//   String format;
//   String version;
//   Map<String, ChampionInfoModel> championInfo;

//   ChampionDetailModel({
//     required this.type,
//     required this.format,
//     required this.version,
//     required this.championInfo,
//   });

//   ChampionDetailModel copyWith({
//     String? type,
//     String? format,
//     String? version,
//     Map<String, ChampionInfoModel>? championInfo,
//   }) {
//     return ChampionDetailModel(
//       type: type ?? this.type,
//       format: format ?? this.format,
//       version: version ?? this.version,
//       championInfo: championInfo ?? this.championInfo,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'type': type,
//       'format': format,
//       'version': version,
//       'championInfo': championInfo,
//     };
//   }

//   factory ChampionDetailModel.fromMap(Map<String, dynamic> map) {
//     return ChampionDetailModel(
//         type: map['type'] as String,
//         format: map['format'] as String,
//         version: map['version'] as String,
//         championInfo: Map<String, ChampionInfoModel>.from(
//           (map['championInfo'] as Map<String, ChampionInfoModel>),
//         ));
//   }

//   String toJson() => json.encode(toMap());

//   factory ChampionDetailModel.fromJson(String source) =>
//       ChampionDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'SummonerDetail(type: $type, format: $format, version: $version, championInfo: $championInfo)';
//   }

//   @override
//   bool operator ==(covariant ChampionDetailModel other) {
//     if (identical(this, other)) return true;

//     return other.type == type &&
//         other.format == format &&
//         other.version == version &&
//         mapEquals(other.championInfo, championInfo);
//   }

//   @override
//   int get hashCode {
//     return type.hashCode ^
//         format.hashCode ^
//         version.hashCode ^
//         championInfo.hashCode;
//   }
// }
