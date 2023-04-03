// To parse this JSON data, do
//
//     final genresMoviesResponse = genresMoviesResponseFromMap(jsonString);

import 'dart:convert';

class GenresMoviesResponse {
  GenresMoviesResponse({required this.genresMapped});

  Map<int, String> genresMapped;

  factory GenresMoviesResponse.fromJson(String str) =>
      GenresMoviesResponse.mappingGenre(json.decode(str));

  factory GenresMoviesResponse.mappingGenre(Map<String, dynamic> json) =>
      GenresMoviesResponse(
        genresMapped: Map<int, String>.from(
          // ignore: prefer_for_elements_to_map_fromiterable
          Map.fromIterable(json["genres"],
              key: (e) => e['id'], value: (e) => e['name']),
        ),
      );
}
