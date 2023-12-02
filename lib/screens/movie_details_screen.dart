import 'package:flutter/material.dart';
import 'package:movie_app/utils/index.dart';

class MovieDetailsScreen extends StatefulWidget {
  final String? movieId;
  const MovieDetailsScreen({super.key, this.movieId});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
              ),
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
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              StringConstants.download,
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
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
                    borderSide: BorderSide(color: Colors.red, width: 4.0),
                    insets: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 50.0),
                  ),
                  indicatorSize: TabBarIndicatorSize.label,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  controller: tabController,
                  tabs: const [
                    Tab(text: StringConstants.moreLikeThis),
                    Tab(text: StringConstants.trailers)
                  ]),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(controller: tabController, children: [
                  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, childAspectRatio: 2 / 3),
                      shrinkWrap: true,
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        return const MovieCardWidget();
                      }),
                  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, childAspectRatio: 2 / 3),
                      shrinkWrap: true,
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        return const MovieCardWidget();
                      })
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
