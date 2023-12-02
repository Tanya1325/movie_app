import 'package:dio/dio.dart';
import 'package:movie_app/data_models/homepage_data_model/upcoming_movies_response_data_model.dart';
import 'package:movie_app/data_models/movie_details_data_model/movie_details_data_model.dart';
import 'package:movie_app/services/api_client.dart';
import 'package:movie_app/utils/app_constants.dart';

abstract class MovieDetailsRepository {
  Future<MovieDetailsDataModel> getMovieDetailData(int? id);

  Future<UpcomingMovies> getSimilarMovies();
}

class MovieDetailsRepositoryImp extends MovieDetailsRepository {
  @override
  Future<MovieDetailsDataModel> getMovieDetailData(int? id) async {
    MovieDetailsDataModel response = await ApiClient(Dio())
        .fetchMovieDetail(id ?? 1, AppConstants.apiKey, "en", "in", "videos");
    return response;
  }

  @override
  Future<UpcomingMovies> getSimilarMovies() async{
   var response = await ApiClient(Dio())
        .fetchUpcomingMovies(AppConstants.apiKey, "en", "in");
    return response;
  }
}
