import 'package:dio/dio.dart';
import 'package:movie_app/services/api_client.dart';
import 'package:movie_app/utils/app_constants.dart';

abstract class MovieDetailsRepository {
  Future<dynamic> getMovieDetailData();
}

class MovieDetailsRepositoryImp extends MovieDetailsRepository {
  @override
  Future<dynamic> getMovieDetailData() async {
    var response =
    await ApiClient(Dio()).fetchUpcomingMovies(AppConstants.apiKey);
    return response;
  }
}
