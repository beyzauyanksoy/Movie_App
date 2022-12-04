// To parse this JSON data, do
//
//     final movieSearchModel = movieSearchModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

MovieSearchModel movieSearchModelFromJson(String str) =>
    MovieSearchModel.fromJson(json.decode(str));

String movieSearchModelToJson(MovieSearchModel data) =>
    json.encode(data.toJson());

class MovieSearchModel {
  MovieSearchModel({
    this.page,
    this.results,
    this.totalResults,
    this.totalPages,
  });

  int? page;
  List<Result>? results;
  int? totalResults;
  int? totalPages;

  factory MovieSearchModel.fromJson(Map<String, dynamic> json) =>
      MovieSearchModel(
        page: json["page"] == null ? null : json["page"],
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalResults:
            json["total_results"] == null ? null : json["total_results"],
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "page": page == null ? null : page,
        "results": results == null
            ? null
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_results": totalResults == null ? null : totalResults,
        "total_pages": totalPages == null ? null : totalPages,
      };
}

class Result {
  Result({
    this.posterPath,
    this.adult,
    this.overview,
    this.releaseDate,
    this.genreIds,
    this.id,
    this.originalTitle,
    this.originalLanguage,
    this.title,
    this.backdropPath,
    this.popularity,
    this.voteCount,
    this.video,
    this.voteAverage,
  });

  String? posterPath;
  bool? adult;
  String? overview;
  DateTime? releaseDate;
  List<int>? genreIds;
  int? id;
  String? originalTitle;
  String? originalLanguage;
  String? title;
  String? backdropPath;
  double? popularity;
  int? voteCount;
  bool? video;
  double? voteAverage;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        adult: json["adult"] == null ? null : json["adult"],
        overview: json["overview"] == null ? null : json["overview"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        genreIds: json["genre_ids"] == null
            ? null
            : List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"] == null ? null : json["id"],
        originalTitle:
            json["original_title"] == null ? null : json["original_title"],
        originalLanguage: json["original_language"] == null
            ? null
            : json["original_language"],
        title: json["title"] == null ? null : json["title"],
        backdropPath:
            json["backdrop_path"] == null ? null : json["backdrop_path"],
        popularity:
            json["popularity"] == null ? null : json["popularity"].toDouble(),
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
        video: json["video"] == null ? null : json["video"],
        voteAverage: json["vote_average"] == null
            ? null
            : json["vote_average"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "poster_path": posterPath == null ? null : posterPath,
        "adult": adult == null ? null : adult,
        "overview": overview == null ? null : overview,
        "release_date": releaseDate == null
            ? null
            : "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate?.month.toString().padLeft(2, '0')}-${releaseDate?.day.toString().padLeft(2, '0')}",
        "genre_ids": genreIds == null
            ? null
            : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id == null ? null : id,
        "original_title": originalTitle == null ? null : originalTitle,
        "original_language": originalLanguage == null ? null : originalLanguage,
        "title": title == null ? null : title,
        "backdrop_path": backdropPath == null ? null : backdropPath,
        "popularity": popularity == null ? null : popularity,
        "vote_count": voteCount == null ? null : voteCount,
        "video": video == null ? null : video,
        "vote_average": voteAverage == null ? null : voteAverage,
      };
}
