import 'package:flutter/cupertino.dart';

import '../model/credits_model.dart';
import '../model/movie_search_model.dart';
import '../model/now_playing_model.dart';
import '../model/popular_movie_id_model.dart';
import '../model/popular_movie_model.dart';
import '../model/rated_top_model.dart';
import '../model/upcoming_model.dart';
import '../services/movie_services.dart';

class MovieProvider with ChangeNotifier {
  PopularMovieModel? popular = PopularMovieModel();
  TopRatedModel? toptated = TopRatedModel();
  NowPlayinModel? nowplaying = NowPlayinModel();
  UpcomingMovieModel? upcoming = UpcomingMovieModel();
  PopularMovieIdModel? popularid = PopularMovieIdModel();
  CreditsModel? creditsid = CreditsModel();
  MovieSearchModel? search = MovieSearchModel();
  String query = "Beyza";

  getPopular() async {
    popular = await Services().getPopularMovie();
    notifyListeners();
  }

  getRatedTop() async {
    toptated = await Services().getTopRated();
    notifyListeners();
  }

  getNowPlaying() async {
    nowplaying = await Services().getNowPlaying();
    notifyListeners();
  }

  getUpcoming() async {
    upcoming = await Services().getUpcoming();
    notifyListeners();
  }

  getPopularid(String? id) async {
    popularid = await Services().getPopularId(id);
    notifyListeners();
  }

  Future getCreditsid(String? id) async {
    creditsid = await Services().getCredits(id);
    notifyListeners();
  }

  getSearchData() async {
    search = await Services().getSearch(query: query);
    notifyListeners();
  }

  getQuery({required String query}) {
    this.query = query;
    getSearchData();
    notifyListeners();
  }
}
