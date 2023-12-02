part of 'homepage_bloc.dart';

@immutable
abstract class HomepageState {}

class HomepageInitialState extends HomepageState {}

class HomepageTrendingMoviesSuccessState extends HomepageState {
  final TrendingMovies? trendingMovies;

  HomepageTrendingMoviesSuccessState(this.trendingMovies);
}

class HomepageUpcomingMoviesSuccessState extends HomepageState {
  final UpcomingMovies? upcomingMovies;

  HomepageUpcomingMoviesSuccessState(this.upcomingMovies);
}

class HomepagePopularMoviesSuccessState extends HomepageState {
  final UpcomingMovies? popularMovies;

  HomepagePopularMoviesSuccessState(this.popularMovies);
}

class HomepageErrorState extends HomepageState {
  final String? message;

  HomepageErrorState(this.message);
}
