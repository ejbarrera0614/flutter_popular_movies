import 'package:flutter/material.dart';
import 'package:popular_movies/models/models.dart';
import 'package:popular_movies/services/genres_movies_service.dart';

class GenresProvider extends ChangeNotifier {
  Map<int, String> _genres = {};
  GeneralError? _genresError;
  bool _isLoading = false;
  GenresProvider() {
    loadGenres();
  }

  Map<int, String> get genres => _genres;
  GeneralError? get genresError => _genresError;
  bool get isLoading => _isLoading;

  setIsLoading(bool isLoading) {
    _isLoading = isLoading;
  }

  setGenres(Map<int, String> genres) {
    _genres = genres;
  }

  setGenresError(GeneralError? generalError) {
    _genresError = generalError;
  }

  loadGenres() async {
    if (isLoading) return;
    setIsLoading(true);
    notifyListeners();

    if (genres.isNotEmpty) return;
    Object response = await GenresService.getGenresMovies();
    if (response is Success) {
      cleanError();
      setGenres(response.response as Map<int, String>);
    }
    if (response is Failure) {
      setGenresError(GeneralError(
          codeError: response.code,
          messageError: response.errorResponse as String));
    }
    setIsLoading(false);
    notifyListeners();
  }

  cleanError() {
    setGenresError(null);
  }
}
