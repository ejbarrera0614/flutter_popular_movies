import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:popular_movies/models/models.dart'
    show GenresMoviesResponse, Failure, Success;
import 'package:popular_movies/utils/constants.dart';

class GenresService {
  static Future<Object> getGenresMovies() async {
    try {
      final url = Uri.https(URL_BASE, PATH_GENRES_MOVIES, {
        'api_key': API_KEY,
        'language': LANGUAGE,
      });
      final response = await http.get(url);
      if (response.statusCode == OK) {
        var movies = GenresMoviesResponse.fromJson(response.body);

        return Success(code: OK, response: movies.genresMapped);
      } else if (response.statusCode == INVALID_TOKEN) {
        return Failure(code: INVALID_TOKEN, errorResponse: 'Token no invalido');
      } else if (response.statusCode == NOT_FOUND) {
        return Failure(code: NOT_FOUND, errorResponse: 'Recurso no encontrado');
      }
      return Failure(
          code: INVALID_RESPONSE, errorResponse: 'Respuesta invalida');
    } on HttpException {
      return Failure(
          code: HTTP_ERROR, errorResponse: 'Sin conexión a internet');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Formato no valido');
    } catch (e) {
      return Failure(
          code: UNKNOWN_ERROR,
          errorResponse: 'Error desconocido v2 ${e.toString()}');
    }
  }
}
