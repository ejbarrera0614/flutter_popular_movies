import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:popular_movies/models/models.dart'
    show MoviesResponse, Failure, Success;
import 'package:popular_movies/utils/constants.dart';

class PopularMoviesService {
  static Future<Object> getPopularMovies(int page) async {
    try {
      final url = Uri.https(URL_BASE, PATH_FAVORITES_MOVIES, {
        'api_key': API_KEY,
        'language': LANGUAGE,
        'page': '$page',
      });
      final response = await http.get(url);
      if (response.statusCode == OK) {
        var movies = MoviesResponse.fromJson(response.body);

        return Success(code: OK, response: movies.results);
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
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Error desconocido');
    }
  }
}
