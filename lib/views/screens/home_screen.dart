import 'package:flutter/material.dart';
import 'package:popular_movies/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:popular_movies/models/models.dart';
import 'package:popular_movies/mixins/scroll_controller_mixin.dart';
import 'package:popular_movies/themes/themes_manager.dart';
import 'package:popular_movies/views/widgets/widgets.dart';
import 'package:popular_movies/view_models/providers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = context.watch<MoviesProvider>();

    return Container(
      decoration: const BoxDecoration(
        gradient: ThemeManager.linearGradienteBg,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text('Películas más populares')),
        body: Column(
          children: [
            if (moviesProvider.isLoading &&
                moviesProvider.popularMovies.isEmpty)
              Expanded(
                child: Center(
                  child: LoadingAnimation(isLoading: moviesProvider.isLoading),
                ),
              )
            else if (moviesProvider.moviesError != null)
              ErrorMessageBody(
                message: moviesProvider.moviesError!.messageError,
                retryFunction: moviesProvider.loadMoreMovies,
              )
            else
              Expanded(
                child: _HomeBody(
                  movies: moviesProvider.popularMovies,
                  nextPage: moviesProvider.loadMoreMovies,
                  isLoading: moviesProvider.isLoading,
                  setMovieSelected: moviesProvider.setSelectedMovie,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _HomeBody extends StatefulWidget {
  final List<MovieModel> movies;
  final Function nextPage;
  final Function setMovieSelected;
  final bool isLoading;
  const _HomeBody({
    required this.movies,
    required this.nextPage,
    required this.isLoading,
    required this.setMovieSelected,
  });

  @override
  State<_HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<_HomeBody> with ScrollControllerMixin {
  @override
  void initState() {
    super.initState();
    initListenerCloseToEndMixin(widget.nextPage, withArrowUpValidation: true);
  }

  final double sizeCircleLoading = 60;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double getCenterPosition = size.width / 2 - (sizeCircleLoading / 2);
    return Stack(children: [
      Center(
        child: SizedBox(
          width: size.width * 0.8,
          child: GridView.builder(
            controller: scrollController,
            itemCount: widget.movies.length,
            gridDelegate: ThemeManager.gridViewDelegateHomeScreen,
            itemBuilder: (_, index) {
              final movie = widget.movies[index];
              return GridCardMovie(
                movie: movie,
                onTapAction: () {
                  widget.setMovieSelected(movie);
                  Navigator.pushNamed(context, DETAIL);
                },
              );
            },
          ),
        ),
      ),
      if (arrowUpButtonMixin != null) arrowUpButtonMixin!,
      Positioned(
        bottom: 20,
        left: getCenterPosition,
        child: LoadingAnimation(
          isLoading: widget.isLoading,
          size: sizeCircleLoading,
        ),
      ),
    ]);
  }
}
