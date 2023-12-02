import 'package:flutter/material.dart';
import 'package:movie_app/screens/account_screen/widgets/downloaded_movies_widget.dart';
import 'package:movie_app/utils/index.dart';
import 'package:movie_app/widgets/movies_list_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  bool isLoading = false;
  HomepageBloc? homepageBloc;
  UpcomingMovies? upcomingMovies;

  @override
  void initState() {
    super.initState();
    homepageBloc = context.read();
    homepageBloc?.add(HomepageUpcomingFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
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
        body:
        BlocBuilder<HomepageBloc, HomepageState>(builder: (context, state) {
          if (state is HomepageInitialState) {
            isLoading = true;
          } else if (state is HomepageUpcomingMoviesSuccessState) {
            isLoading = false;
            upcomingMovies = state.upcomingMovies;
            homepageBloc?.add(HomepageTrendingFetchEvent());
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
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringConstants.myList,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge,
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(StringConstants.viewAll, style: Theme
                              .of(context)
                              .textTheme
                              .labelMedium)),
                      const Icon(
                        (Icons.arrow_forward_ios_rounded),
                        size: 16.0,
                      )
                    ],
                  )
                ],
              ),
              const SmallSpacingWidget(),
              MoviesListWidget(results: upcomingMovies?.results),
              const MediumSpacingWidget(),
              Text(
                StringConstants.downloadedMovies,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge,
              ),
              const SmallSpacingWidget(),
              SizedBox(
                height: MediaQuery.of(context).size.height/2,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: upcomingMovies?.results?.length ?? 0,
                    separatorBuilder: (context,index){
                      return const SizedBox(width: 12.0,);
                    },
                    itemBuilder: (context, index) {
                      return DownloadedMoviesWidget(
                          imageSrc: upcomingMovies?.results?[index].backdropPath,
                          movieName: upcomingMovies?.results?[index].title);
                    }),
              ),
            ],
          ),)
          ,
          );
        }));
  }
}
