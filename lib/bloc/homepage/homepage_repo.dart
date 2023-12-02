import 'package:dio/dio.dart';
import 'package:movie_app/data_models/homepage_data_model/trending_movies_response_data_model.dart';
import 'package:movie_app/data_models/homepage_data_model/upcoming_movies_response_data_model.dart';
import 'package:movie_app/services/api_client.dart';
import 'package:movie_app/utils/app_constants.dart';

abstract class HomepageRepository {
  Future<UpcomingMovies> getUpcomingMovies();

  Future<TrendingMovies> getTrendingMovies();

  Future<UpcomingMovies> getPopularMovies();
}

class HomepageRepositoryImp extends HomepageRepository {
  @override
  Future<UpcomingMovies> getUpcomingMovies() async {
    UpcomingMovies response =
        await ApiClient(Dio()).fetchUpcomingMovies(AppConstants.apiKey);
    return response;
  }

  @override
  Future<TrendingMovies> getTrendingMovies() async {
    TrendingMovies response =
        await ApiClient(Dio()).fetchTrendingMovies(AppConstants.apiKey);
    return response;
  }

  @override
  Future<UpcomingMovies> getPopularMovies() async {
    UpcomingMovies response =
        await ApiClient(Dio()).fetchPopularMovies(AppConstants.apiKey);
    return response;
  }
}
