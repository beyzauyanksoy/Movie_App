
 import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/now_playing_model.dart';
import '../model/popular_movie_id_model.dart';
import '../model/popular_movie_model.dart';
import '../model/rated_top_model.dart';
import '../model/upcoming_model.dart';


class Services{
final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://api.themoviedb.org/3/movie/",
     
    ),
  );



   Future<PopularMovieModel?> getPopularMovie() async {
    PopularMovieModel? model;

    try {
      final response = await _dio
          .get("popular?api_key=6ea7b819cfc7cf82e10a6426b439ca9a&language=en-US&page=1");
      if (response.statusCode == 200) {
        print(response.data);
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
      final response = await _dio
          .get("top_rated?api_key=6ea7b819cfc7cf82e10a6426b439ca9a&language=en-US&page=1");
      if (response.statusCode == 200) {
        print(response.data);
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
      final response = await _dio
          .get("/now_playing?api_key=6ea7b819cfc7cf82e10a6426b439ca9a&language=en-US&page=1");
      if (response.statusCode == 200) {
        print(response.data);
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
      final response = await _dio
          .get("/upcoming?api_key=6ea7b819cfc7cf82e10a6426b439ca9a&language=en-US&page=1");
      if (response.statusCode == 200) {
        print(response.data);
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
      final response = await _dio.get("movie/$id?api_key=6ea7b819cfc7cf82e10a6426b439ca9a&language=en-US");
      if (response.statusCode == 200) {
        model = PopularMovieIdModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }
}