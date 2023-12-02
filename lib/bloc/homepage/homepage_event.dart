part of 'homepage_bloc.dart';

@immutable
abstract class HomepageEvent {}

class HomepageTrendingFetchEvent extends HomepageEvent{}

class HomepageUpcomingFetchEvent extends HomepageEvent{}

class HomepagePopularFetchEvent extends HomepageEvent{}