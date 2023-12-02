import 'package:dio/dio.dart';
import 'package:movie_app/data_models/homepage_data_model/trending_movies_response_data_model.dart';
import 'package:movie_app/data_models/homepage_data_model/upcoming_movies_response_data_model.dart';
import 'package:movie_app/utils/api_constants.dart';
import 'package:retrofit/retrofit.dart';

import '../data_models/movie_details_data_model/movie_details_data_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/")
abstract class ApiClient {
  // Dio dio = Dio(BaseOptions(
  //   contentType: "application/json"
  // ));
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(APIConstants.upcomingMovies)
  Future<UpcomingMovies> fetchUpcomingMovies(
    @Query('api_key') String apiKey,
    @Query('language') String language,
    @Query('region') String region,
  );

  @GET(APIConstants.trendingMovies)
  Future<TrendingMovies> fetchTrendingMovies(
    @Query('api_key') String apiKey,
    @Query('language') String language,
    @Query('region') String region,
  );

  @GET(APIConstants.popularMovies)
  Future<UpcomingMovies> fetchPopularMovies(
    @Query('api_key') String apiKey,
    @Query('language') String language,
    @Query('region') String region,
  );

  @GET(APIConstants.movieDetails)
  Future<MovieDetailsDataModel> fetchMovieDetail(
    @Path('movie_id') int movieId,
    @Query('api_key') String apiKey,
    @Query('language') String language,
    @Query('region') String region,
    @Query('append_to_response') String appendVideos,
  );
}
