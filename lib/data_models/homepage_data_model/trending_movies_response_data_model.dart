import 'package:movie_app/data_models/homepage_data_model/upcoming_movies_response_data_model.dart';

class TrendingMovies {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  TrendingMovies({this.page, this.results, this.totalPages, this.totalResults});

  TrendingMovies.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}