import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:popular_movies/themes/themes_manager.dart';
import 'package:popular_movies/models/models.dart' show MovieModel;
import 'package:popular_movies/view_models/providers.dart';
import 'package:popular_movies/views/widgets/widgets.dart'
    show GenresMovieWrap, SubtitleCore, TextInfoCard, TextStarIcon, TitleCore;

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MovieModel movie = context.watch<MoviesProvider>().selectedMovie;
    final mediaQuery = MediaQuery.of(context);
    final bool isPortrait = mediaQuery.orientation == Orientation.portrait;

    /// Cálculos que se realizan para posicionar el contenido si es landscape o portrait
    final double borderContainer = isPortrait ? 60 : 0;
    final heightImgSize = mediaQuery.size.height / 2.5;
    final double marginTopContainer =
        isPortrait ? heightImgSize - borderContainer : 0;
    final double minContentHeight = mediaQuery.size.height - marginTopContainer;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          if (isPortrait)
            _BackGroundImg(movie: movie, heightImgSize: heightImgSize),
          SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(minHeight: minContentHeight),
              padding: ThemeManager.paddingContentDetailsScreen,
              decoration: BoxDecoration(
                gradient: ThemeManager.linearGradienteBg,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderContainer),
                  topRight: Radius.circular(borderContainer),
                ),
              ),
              margin: EdgeInsets.only(top: marginTopContainer),
              child: _DetailScreenBody(movie: movie),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackGroundImg extends StatelessWidget {
  const _BackGroundImg({
    super.key,
    required this.movie,
    required this.heightImgSize,
  });

  final MovieModel movie;
  final double heightImgSize;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: movie.heroId!,
      child: FadeInImage(
        filterQuality: FilterQuality.high,
        height: heightImgSize,
        width: double.infinity,
        fit: BoxFit.cover,
        placeholder: const AssetImage('assets/no-image.jpg'),
        image: NetworkImage(movie.fullBackdropPath),
      ),
    );
  }
}

class _DetailScreenBody extends StatelessWidget {
  const _DetailScreenBody({
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleCore(title: movie.title),
        SubtitleCore(subtitle: movie.originalTitle),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: ThemeManager.borderCircularCard,
              child: FadeInImage(
                  width: 140,
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movie.fullPosterImg)),
            ),
            Expanded(
              child: _RateAndGenreInfo(movie: movie),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          movie.overview,
          style: const TextStyle(
              decoration: TextDecoration.none,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white),
        ),
      ],
    );
  }
}

class _RateAndGenreInfo extends StatelessWidget {
  const _RateAndGenreInfo({
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GenresMovieWrap(genreIds: movie.genreIds),
        const SizedBox(height: 5),
        TextStarIcon('${movie.voteAverage}'),
        TextInfoCard('${movie.voteCount} votos', paddingLeft: 0),
      ]),
    );
  }
}
