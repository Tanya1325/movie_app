import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/utils/index.dart';

class MoviesListWidget extends StatelessWidget {
  final List<Results>? results;
  const MoviesListWidget({super.key, this.results});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    builder: (context) => BlocProvider(
                        create: (create) => MovieDetailsBloc(
                            movieDetailsRepositoryImp:
                                MovieDetailsRepositoryImp()),
                        child: MovieDetailsScreen(
                            movieId: results?[index].id))));
              },
              child: MovieCardWidget(
                results: results?[index],
              ));
        },
        itemCount: 5,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
