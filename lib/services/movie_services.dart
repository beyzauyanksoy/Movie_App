import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/credits_model.dart';
import '../model/movie_search_model.dart';
import '../model/now_playing_model.dart';
import '../model/popular_movie_id_model.dart';
import '../model/popular_movie_model.dart';
import '../model/rated_top_model.dart';
import '../model/upcoming_model.dart';

class Services {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://api.themoviedb.org/3/movie/",
    ),
  );

  final Dio _dio2 = Dio(
    BaseOptions(
      baseUrl: "https://api.themoviedb.org/3/search/",
    ),
  );

  Future<PopularMovieModel?> getPopularMovie() async {
    PopularMovieModel? model;

    try {
      final response = await _dio.get(
          "popular?api_key=6ea7b819cfc7cf82e10a6426b439ca9a&language=en-US&page=1");
      if (response.statusCode == 200) {
        model = PopularMovieModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }

  Future<TopRatedModel?> getTopRated() async {
    TopRatedModel? model;

    try {
      final response = await _dio.get(
          "top_rated?api_key=6ea7b819cfc7cf82e10a6426b439ca9a&language=en-US&page=1");
      if (response.statusCode == 200) {
        model = TopRatedModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }

  Future<NowPlayinModel?> getNowPlaying() async {
    NowPlayinModel? model;

    try {
      final response = await _dio.get(
          "/now_playing?api_key=6ea7b819cfc7cf82e10a6426b439ca9a&language=en-US&page=1");
      if (response.statusCode == 200) {
        model = NowPlayinModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }

  Future<UpcomingMovieModel?> getUpcoming() async {
    UpcomingMovieModel? model;

    try {
      final response = await _dio.get(
          "/upcoming?api_key=6ea7b819cfc7cf82e10a6426b439ca9a&language=en-US&page=1");
      if (response.statusCode == 200) {
        model = UpcomingMovieModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }

  Future<PopularMovieIdModel?> getPopularId(String? id) async {
    PopularMovieIdModel? model;
    try {
      final response = await _dio
          .get("$id?api_key=6ea7b819cfc7cf82e10a6426b439ca9a&language=en-US");
      if (response.statusCode == 200) {
        model = PopularMovieIdModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }

  Future<CreditsModel?> getCredits(String? id) async {
    CreditsModel? model;
    try {
      final response = await _dio.get(
          "$id/credits?api_key=6ea7b819cfc7cf82e10a6426b439ca9a&language=en-US");
      if (response.statusCode == 200) {
        model = CreditsModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }

  Future<MovieSearchModel?> getSearch({required String query}) async {
    MovieSearchModel searchModels;

    try {
      final response = await _dio2.get(
          "movie?api_key=6ea7b819cfc7cf82e10a6426b439ca9a&language=en-US&page=1&query=$query'");
      searchModels = MovieSearchModel.fromJson(response.data);

      if (response.statusCode == 200) {
        print("Çalışıyor");
      } else {
        print("Çalışmıyor");
      }
      return searchModels;
    } catch (e) {
      print(e);
    }
  }
}
