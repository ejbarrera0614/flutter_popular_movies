import 'package:flutter/material.dart';
import 'package:popular_movies/models/models.dart';
import 'package:popular_movies/services/popular_movies_service.dart';

class MoviesProvider extends ChangeNotifier {
  List<MovieModel> _popularMovies = [];
  late MovieModel _selectedMovie;
  int _popularPage = 0;
  bool _isLoading = false;
  GeneralError? _generalError;

  MoviesProvider() {
    loadMoreMovies();
  }

  bool get isLoading => _isLoading;
  int get popularPage => _popularPage;
  List<MovieModel> get popularMovies => _popularMovies;
  MovieModel get selectedMovie => _selectedMovie;
  GeneralError? get moviesError => _generalError;

  setIsLoading(bool isLoading) {
    _isLoading = isLoading;
  }

  setPopularPage(int popularPage) {
    _popularPage = popularPage;
  }

  setPopularMovies(List<MovieModel> popularMovies) {
    _popularMovies = popularMovies;
  }

  setMoviesError(GeneralError? moviesError) {
    _generalError = moviesError;
  }

  setSelectedMovie(MovieModel selectedMovie) {
    _selectedMovie = selectedMovie;
  }

  loadMoreMovies() async {
    if (isLoading) return;
    setIsLoading(true);
    notifyListeners();
    _popularPage += 1;
    Object response = await PopularMoviesService.getPopularMovies(_popularPage);
    if (response is Success) {
      cleanError();
      setPopularMovies([
        ...popularMovies,
        ...response.response as List<MovieModel>,
      ]);
    }
    if (response is Failure) {
      _popularPage -= 1;
      setMoviesError(
        GeneralError(
            codeError: response.code,
            messageError: response.errorResponse as String),
      );
    }
    setIsLoading(false);
    notifyListeners();
  }

  cleanError() {
    setMoviesError(null);
  }
}
