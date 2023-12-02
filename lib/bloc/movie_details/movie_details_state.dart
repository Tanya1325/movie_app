part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsState {}

class MovieDetailsInitialState extends MovieDetailsState {}

class MovieDetailsFetchSuccessState extends MovieDetailsState {}

class MovieDetailsErrorState extends MovieDetailsState {
  final String? message;

  MovieDetailsErrorState(this.message);
}
