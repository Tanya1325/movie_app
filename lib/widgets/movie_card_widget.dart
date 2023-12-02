import 'package:flutter/material.dart';
import 'package:movie_app/data_models/homepage_data_model/upcoming_movies_response_data_model.dart';

class MovieCardWidget extends StatelessWidget {
  final Results? results;

  const MovieCardWidget({super.key, this.results});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            "https://image.tmdb.org/t/p/w500/${results?.posterPath ?? ""}",
            fit: BoxFit.cover,
          )),
    );
  }
}
