import 'package:flutter/material.dart';
import 'package:movie_app/bloc/homepage/homepage_bloc.dart';
import 'package:movie_app/data_models/homepage_data_model/trending_movies_response_data_model.dart';
import 'package:movie_app/data_models/homepage_data_model/upcoming_movies_response_data_model.dart';
import 'package:movie_app/utils/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isLoading = false;
  HomepageBloc? homepageBloc;
  UpcomingMovies? upcomingMovies;
  TrendingMovies? trendingMovies;
  UpcomingMovies? popularMovies;

  @override
  void initState() {
    super.initState();
    homepageBloc = context.read();
    homepageBloc?.add(HomepageUpcomingFetchEvent());
    homepageBloc?.add(HomepageTrendingFetchEvent());
    homepageBloc?.add(HomepagePopularFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: 32.0,
              ),
            )
          ],
        ),
        body:
            BlocBuilder<HomepageBloc, HomepageState>(builder: (context, state) {
          if (state is HomepageInitialState) {
            isLoading = true;
          } else if (state is HomepageUpcomingMoviesSuccessState) {
            isLoading = false;
            upcomingMovies = state.upcomingMovies;
          } else if (state is HomepageTrendingMoviesSuccessState) {
            isLoading = false;
            trendingMovies = state.trendingMovies;
          } else if (state is HomepagePopularMoviesSuccessState) {
            isLoading = false;
            popularMovies = state.popularMovies;
          } else {
            isLoading = false;
          }
          return isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          StringConstants.nowTrending,
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        const SmallSpacingWidget(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 4.5,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 4.0,
                              );
                            },
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MovieDetailsScreen()));
                                  },
                                  child: MovieCardWidget(
                                    results: upcomingMovies?.results?[index],
                                  ));
                            },
                            itemCount: 5,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        const MediumSpacingWidget(),
                        const Text(
                          StringConstants.popular,
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        const SmallSpacingWidget(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 4.5,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 4.0,
                              );
                            },
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MovieDetailsScreen()));
                                  },
                                  child: MovieCardWidget(
                                    results: trendingMovies?.results?[index],
                                  ));
                            },
                            itemCount: 5,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        const MediumSpacingWidget(),
                        const Text(
                          StringConstants.upcoming,
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        const SmallSpacingWidget(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 4.5,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 4.0,
                              );
                            },
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MovieDetailsScreen()));
                                  },
                                  child: MovieCardWidget(
                                    results: popularMovies?.results?[index],
                                  ));
                            },
                            itemCount: 5,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                          ),
                        )
                      ],
                    ),
                  ),
                );
        }));
  }
}
