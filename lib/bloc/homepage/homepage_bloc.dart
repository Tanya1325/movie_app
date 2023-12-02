import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data_models/homepage_data_model/trending_movies_response_data_model.dart';
import 'package:movie_app/data_models/homepage_data_model/upcoming_movies_response_data_model.dart';
import 'homepage_repo.dart';
part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  final HomepageRepositoryImp? homepageRepositoryImp;
  HomepageBloc({this.homepageRepositoryImp}) : super(HomepageInitialState()) {
    on<HomepageEvent>((event, emit) async{
      emit(HomepageInitialState());
        if (event is HomepageUpcomingFetchEvent) {
          var model = await homepageRepositoryImp?.getUpcomingMovies();
          try {
            if (model != null) {
            emit(HomepageUpcomingMoviesSuccessState(model));
          }
          else {
            emit(HomepageErrorState(''));
          }
        }catch(e){
            emit(HomepageErrorState(e.toString()));
          }
      }
      if (event is HomepageTrendingFetchEvent) {
        var model = await homepageRepositoryImp?.getTrendingMovies();
        try {
          if (model != null) {
            emit(HomepageTrendingMoviesSuccessState(model));
          }
          else {
            emit(HomepageErrorState(''));
          }
        }catch(e){
          emit(HomepageErrorState(e.toString()));
        }
      }
      if (event is HomepagePopularFetchEvent) {
        var model = await homepageRepositoryImp?.getPopularMovies();
        try {
          if (model != null) {
            emit(HomepagePopularMoviesSuccessState(model));
          }
          else {
            emit(HomepageErrorState(''));
          }
        }catch(e){
          emit(HomepageErrorState(e.toString()));
        }
      }
    });
  }
}
