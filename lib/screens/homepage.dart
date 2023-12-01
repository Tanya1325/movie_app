import 'package:flutter/material.dart';
import 'package:movie_app/screens/movie_details_screen.dart';
import 'package:movie_app/utils/string_constants.dart';
import 'package:movie_app/widgets/movie_card_widget.dart';
import 'package:movie_app/widgets/spacing_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const MovieDetailsScreen()));
                        },
                        child: const MovieCardWidget());
                  },
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const MediumSpacingWidget(),
              const Text(
                StringConstants.feelGoodMovies,
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const MovieDetailsScreen()));
                        },
                        child: const MovieCardWidget());
                  },
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const MediumSpacingWidget(),
              const Text(
                StringConstants.realLifeMovies,
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const MovieDetailsScreen()));
                        },
                        child: const MovieCardWidget());
                  },
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
