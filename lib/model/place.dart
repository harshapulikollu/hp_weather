// To parse this JSON data, do
//
//     final place = placeFromJson(jsonString);

import 'dart:convert';

class Place {
  final int placeId;
  final String licence;
  final String osmType;
  final int osmId;
  final List<String> boundingbox;
  final String lat;
  final String lon;
  final String displayName;
  final String placeClass;
  final String type;
  final double importance;
  final String? icon;

  Place({
    required this.placeId,
    required this.licence,
    required this.osmType,
    required this.osmId,
    required this.boundingbox,
    required this.lat,
    required this.lon,
    required this.displayName,
    required this.placeClass,
    required this.type,
    required this.importance,
    this.icon,
  });

  Place copyWith({
    int? placeId,
    String? licence,
    String? osmType,
    int? osmId,
    List<String>? boundingbox,
    String? lat,
    String? lon,
    String? displayName,
    String? placeClass,
    String? type,
    double? importance,
    String? icon,
  }) =>
      Place(
        placeId: placeId ?? this.placeId,
        licence: licence ?? this.licence,
        osmType: osmType ?? this.osmType,
        osmId: osmId ?? this.osmId,
        boundingbox: boundingbox ?? this.boundingbox,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        displayName: displayName ?? this.displayName,
        placeClass: placeClass ?? this.placeClass,
        type: type ?? this.type,
        importance: importance ?? this.importance,
        icon: icon ?? this.icon,
      );

  factory Place.fromRawJson(String str) => Place.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        placeId: json["place_id"],
        licence: json["licence"],
        osmType: json["osm_type"],
        osmId: json["osm_id"],
        boundingbox: List<String>.from(json["boundingbox"].map((x) => x)),
        lat: json["lat"],
        lon: json["lon"],
        displayName: json["display_name"],
        placeClass: json["class"],
        type: json["type"],
        importance: json["importance"]?.toDouble(),
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "place_id": placeId,
        "licence": licence,
        "osm_type": osmType,
        "osm_id": osmId,
        "boundingbox": List<dynamic>.from(boundingbox.map((x) => x)),
        "lat": lat,
        "lon": lon,
        "display_name": displayName,
        "class": placeClass,
        "type": type,
        "importance": importance,
        "icon": icon,
      };
}
