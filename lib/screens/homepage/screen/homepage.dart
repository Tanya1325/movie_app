import 'package:flutter/material.dart';
import 'package:movie_app/data_models/homepage_data_model/popular_movies_response_data_model.dart';
import 'package:movie_app/utils/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/widgets/movies_list_widget.dart';

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
  PopularMovies? popularMovies;

  @override
  void initState() {
    super.initState();
    homepageBloc = context.read();
    homepageBloc?.add(HomepageUpcomingFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(StringConstants.search),
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
      body: BlocBuilder<HomepageBloc, HomepageState>(builder: (context, state) {
        if (state is HomepageInitialState) {
          isLoading = true;
        } else if (state is HomepageUpcomingMoviesSuccessState) {
          isLoading = false;
          upcomingMovies = state.upcomingMovies;
          homepageBloc?.add(HomepageTrendingFetchEvent());
        } else if (state is HomepageTrendingMoviesSuccessState) {
          isLoading = false;
          trendingMovies = state.trendingMovies;
          homepageBloc?.add(HomepagePopularFetchEvent());
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
                      MoviesListWidget(results: trendingMovies?.results),
                      const MediumSpacingWidget(),
                      const Text(
                        StringConstants.popular,
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      const SmallSpacingWidget(),
                      MoviesListWidget(results: popularMovies?.results),
                      const MediumSpacingWidget(),
                      const Text(
                        StringConstants.upcoming,
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      const SmallSpacingWidget(),
                      MoviesListWidget(results: upcomingMovies?.results),
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
