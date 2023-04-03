import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:popular_movies/view_models/providers.dart' show GenresProvider;

class GenresMovieWrap extends StatelessWidget {
  const GenresMovieWrap({
    super.key,
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
          ...genreIds.map(
            (e) => Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.tealAccent),
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                genresProvider.genres[e]!,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}
