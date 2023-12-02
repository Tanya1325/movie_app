part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsState {}

class MovieDetailsInitialState extends MovieDetailsState {}

class MovieDetailsFetchSuccessState extends MovieDetailsState {
  final MovieDetailsDataModel? model;

  MovieDetailsFetchSuccessState(this.model);
}

class SimilarMoviesFetchSuccessState extends MovieDetailsState {
  final UpcomingMovies? movies;
  SimilarMoviesFetchSuccessState(this.movies);
}

class MovieDetailsErrorState extends MovieDetailsState {
  final String? message;

  MovieDetailsErrorState(this.message);
}
