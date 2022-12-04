// To parse this JSON data, do
//
//     final creditsModel = creditsModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

CreditsModel creditsModelFromJson(String str) =>
    CreditsModel.fromJson(json.decode(str));

String creditsModelToJson(CreditsModel data) => json.encode(data.toJson());

class CreditsModel {
  CreditsModel({
    this.id,
    this.cast,
    this.crew,
  });

  dynamic id;
  List<Cast>? cast;
  List<Crew>? crew;

  factory CreditsModel.fromJson(Map<String, dynamic> json) => CreditsModel(
        id: json["id"] == null ? null : json["id"],
        cast: json["cast"] == null
            ? null
            : List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
        crew: json["crew"] == null
            ? null
            : List<Crew>.from(json["crew"].map((x) => Crew.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "cast": cast == null
            ? null
            : List<dynamic>.from(cast!.map((x) => x.toJson())),
        "crew": crew == null
            ? null
            : List<dynamic>.from(crew!.map((x) => x.toJson())),
      };
}

class Cast {
  Cast({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });

  bool? adult;
  dynamic gender;
  dynamic id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  dynamic popularity;
  String? profilePath;
  dynamic castId;
  String? character;
  String? creditId;
  dynamic order;

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        adult: json["adult"] == null ? null : json["adult"],
        gender: json["gender"] == null ? null : json["gender"],
        id: json["id"] == null ? null : json["id"],
        knownForDepartment: json["known_for_department"] == null
            ? null
            : json["known_for_department"],
        name: json["name"] == null ? null : json["name"],
        originalName:
            json["original_name"] == null ? null : json["original_name"],
        popularity:
            json["popularity"] == null ? null : json["popularity"].toString(),
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
        castId: json["cast_id"] == null ? null : json["cast_id"],
        character: json["character"] == null ? null : json["character"],
        creditId: json["credit_id"] == null ? null : json["credit_id"],
        order: json["order"] == null ? null : json["order"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult == null ? null : adult,
        "gender": gender == null ? null : gender,
        "id": id == null ? null : id,
        "known_for_department":
            knownForDepartment == null ? null : knownForDepartment,
        "name": name == null ? null : name,
        "original_name": originalName == null ? null : originalName,
        "popularity": popularity == null ? null : popularity,
        "profile_path": profilePath == null ? null : profilePath,
        "cast_id": castId == null ? null : castId,
        "character": character == null ? null : character,
        "credit_id": creditId == null ? null : creditId,
        "order": order == null ? null : order,
      };
}

class Crew {
  Crew({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.creditId,
    this.department,
    this.job,
  });

  bool? adult;
  dynamic gender;
  dynamic id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  dynamic popularity;
  String? profilePath;
  String? creditId;
  String? department;
  String? job;

  factory Crew.fromJson(Map<String, dynamic> json) => Crew(
        adult: json["adult"] == null ? null : json["adult"],
        gender: json["gender"] == null ? null : json["gender"],
        id: json["id"] == null ? null : json["id"],
        knownForDepartment: json["known_for_department"] == null
            ? null
            : json["known_for_department"],
        name: json["name"] == null ? null : json["name"],
        originalName:
            json["original_name"] == null ? null : json["original_name"],
        popularity:
            json["popularity"] == null ? null : json["popularity"].toString(),
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
        creditId: json["credit_id"] == null ? null : json["credit_id"],
        department: json["department"] == null ? null : json["department"],
        job: json["job"] == null ? null : json["job"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult == null ? null : adult,
        "gender": gender == null ? null : gender,
        "id": id == null ? null : id,
        "known_for_department":
            knownForDepartment == null ? null : knownForDepartment,
        "name": name == null ? null : name,
        "original_name": originalName == null ? null : originalName,
        "popularity": popularity == null ? null : popularity,
        "profile_path": profilePath == null ? null : profilePath,
        "credit_id": creditId == null ? null : creditId,
        "department": department == null ? null : department,
        "job": job == null ? null : job,
      };
}
