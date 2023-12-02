part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent {}

class MovieDetailsFetchEvent extends MovieDetailsEvent{
  final int? movieId;
  MovieDetailsFetchEvent(this.movieId);
}