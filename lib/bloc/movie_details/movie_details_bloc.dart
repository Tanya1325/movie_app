import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data_models/homepage_data_model/upcoming_movies_response_data_model.dart';
import 'package:movie_app/data_models/movie_details_data_model/movie_details_data_model.dart';

import 'movie_details_repo.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MovieDetailsRepositoryImp? movieDetailsRepositoryImp;

  MovieDetailsBloc({this.movieDetailsRepositoryImp})
      : super(MovieDetailsInitialState()) {
    on<MovieDetailsEvent>((event, emit) async {
      emit(MovieDetailsInitialState());
      if (event is MovieDetailsFetchEvent) {
        var model =
            await movieDetailsRepositoryImp?.getMovieDetailData(event.movieId);
        try {
          if (model != null) {
            emit(MovieDetailsFetchSuccessState(model));
          } else {
            emit(MovieDetailsErrorState(''));
          }
        } catch (e) {
          emit(MovieDetailsErrorState(e.toString()));
        }
      }
      if (event is SimilarMoviesFetchEvent) {
        var model = await movieDetailsRepositoryImp?.getSimilarMovies();
        try {
          if (model != null) {
            emit(SimilarMoviesFetchSuccessState(model));
          } else {
            emit(MovieDetailsErrorState(''));
          }
        } catch (e) {
          emit(MovieDetailsErrorState(e.toString()));
        }
      }
    });
  }
}
