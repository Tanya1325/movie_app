import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie_details/movie_details_bloc.dart';
import 'package:movie_app/data_models/movie_details_data_model/movie_details_data_model.dart';
import 'package:movie_app/utils/index.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int? movieId;

  const MovieDetailsScreen({super.key, this.movieId});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  MovieDetailsBloc? movieDetailsBloc;
  MovieDetailsDataModel? dataModel;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    print("${widget.movieId}");
    tabController = TabController(length: 1, vsync: this);
    movieDetailsBloc = context.read();
    movieDetailsBloc?.add(MovieDetailsFetchEvent(widget.movieId));
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
        body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
            builder: (context, state) {
          if (state is MovieDetailsInitialState) {
            isLoading = true;
          } else if (state is MovieDetailsFetchSuccessState) {
            isLoading = false;
            dataModel = state.model;
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Text(
                          dataModel?.title ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: Colors.white),
                        ),
                        const SmallSpacingWidget(),
                        Text(
                          dataModel?.overview ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: Colors.white),
                        ),
                        const SmallSpacingWidget(),
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 48.0,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/play-button.png',
                                        color: Colors.black,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          StringConstants.play,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ]))),
                        const SmallSpacingWidget(),
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 48.0,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey.shade600),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/download.png',
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        StringConstants.download,
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ))),
                        const MediumSpacingWidget(),
                        const ActionButtons(),
                        const SmallSpacingWidget(),
                        TabBar(
                            labelStyle: const TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w500),
                            indicator: const UnderlineTabIndicator(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 4.0),
                              insets: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 50.0),
                            ),
                            indicatorSize: TabBarIndicatorSize.label,
                            tabAlignment: TabAlignment.start,
                            isScrollable: true,
                            controller: tabController,
                            tabs: const [
                              Tab(text: StringConstants.moreLikeThis),
                            ]),
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child:
                              TabBarView(controller: tabController, children: [
                            GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 2 / 3),
                                shrinkWrap: true,
                                itemCount: 12,
                                itemBuilder: (context, index) {
                                  return const MovieCardWidget();
                                }),
                          ]),
                        )
                      ],
                    ),
                  ),
                );
        }));
  }
}
