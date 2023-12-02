import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

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
        var model = await movieDetailsRepositoryImp?.getMovieDetailData();
        try {
          if (model != null) {
            emit(MovieDetailsFetchSuccessState());
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
