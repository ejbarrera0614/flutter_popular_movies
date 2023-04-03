import 'package:flutter/material.dart';
import 'package:popular_movies/themes/themes_manager.dart';
import 'package:popular_movies/view_models/providers.dart';
import 'package:popular_movies/views/widgets/text_info_card.dart';
import 'package:provider/provider.dart';
import 'package:popular_movies/models/models.dart' show MovieModel;

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MovieModel movie = context.watch<MoviesProvider>().selectedMovie;
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    final double borderContainer = isPortrait ? 60 : 0;
    final heightImgSize = MediaQuery.of(context).size.height / 2.5;
    final double marginTopContainer =
        isPortrait ? heightImgSize - borderContainer : 0;

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
              constraints: BoxConstraints(
                  minHeight:
                      MediaQuery.of(context).size.height - marginTopContainer),
              padding: const EdgeInsets.only(
                  left: 40, right: 40, top: kToolbarHeight, bottom: 10),
              decoration: BoxDecoration(
                gradient: ThemeManager.linearGradienteBg,
                color: ThemeManager.generalContentColor,
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
        Text(
          movie.title,
          style: const TextStyle(
              decoration: TextDecoration.none,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        Text(
          movie.originalTitle,
          style: const TextStyle(
              decoration: TextDecoration.none,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white),
        ),
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
        const SizedBox(
          height: 10,
        ),
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
        _GenresWidget(genreIds: movie.genreIds),
        RichText(
          text: TextSpan(
            style: const TextStyle(
                decoration: TextDecoration.none,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.white),
            text: '${movie.voteAverage}',
            children: const [
              WidgetSpan(child: SizedBox(width: 10)),
              WidgetSpan(
                  child: Icon(
                Icons.star_border,
                color: Colors.yellowAccent,
              ))
            ],
          ),
        ),
        Text(
          '${movie.voteCount} votos',
          style: const TextStyle(
            decoration: TextDecoration.none,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        )
      ]),
    );
  }
}

class _GenresWidget extends StatelessWidget {
  const _GenresWidget({
    required this.genreIds,
  });

  final List<int> genreIds;

  @override
  Widget build(BuildContext context) {
    final GenresProvider genresProvider = context.watch<GenresProvider>();

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        if (genresProvider.isLoading)
          const Text('Cargando géneros de la película...'),
        if (genresProvider.genresError != null)
          const Text('Ocurrió un error cargando géneros de la película...'),
        if (!genresProvider.isLoading && genresProvider.genres.isNotEmpty)
          ...genreIds.map((e) => Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.tealAccent),
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(genresProvider.genres[e]!))),
      ],
    );
  }
}
