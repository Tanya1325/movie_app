import 'package:dio/dio.dart';
import 'package:movie_app/data_models/homepage_data_model/popular_movies_response_data_model.dart';
import 'package:movie_app/data_models/homepage_data_model/trending_movies_response_data_model.dart';
import 'package:movie_app/data_models/homepage_data_model/upcoming_movies_response_data_model.dart';
import 'package:movie_app/services/api_client.dart';
import 'package:movie_app/utils/app_constants.dart';

abstract class HomepageRepository {
  Future<UpcomingMovies> getUpcomingMovies();

  Future<TrendingMovies> getTrendingMovies();

  Future<PopularMovies> getPopularMovies();
}

class HomepageRepositoryImp extends HomepageRepository {
  @override
  Future<UpcomingMovies> getUpcomingMovies() async {
    UpcomingMovies response =
        await ApiClient(Dio()).fetchUpcomingMovies(AppConstants.apiKey,"en","in");
    return response;
  }

  @override
  Future<TrendingMovies> getTrendingMovies() async {
    TrendingMovies response =
        await ApiClient(Dio()).fetchTrendingMovies(AppConstants.apiKey,"en","in");
    return response;
  }

  @override
  Future<PopularMovies> getPopularMovies() async {
    PopularMovies response =
        await ApiClient(Dio()).fetchPopularMovies(AppConstants.apiKey,"en","in");
    return response;
  }
}
