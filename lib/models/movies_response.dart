import 'dart:convert';
import 'package:popular_movies/models/movie_model.dart';

class MoviesResponse {
  MoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<MovieModel> results;
  int totalPages;
  int totalResults;

  factory MoviesResponse.fromJson(String str) =>
      MoviesResponse.fromMap(json.decode(str));

  factory MoviesResponse.fromMap(Map<String, dynamic> json) => MoviesResponse(
        page: json["page"],
        results: List<MovieModel>.from(
            json["results"].map((x) => MovieModel.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
