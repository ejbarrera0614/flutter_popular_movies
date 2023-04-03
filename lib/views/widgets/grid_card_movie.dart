import 'package:flutter/material.dart';
import 'package:popular_movies/models/models.dart' show MovieModel;
import 'package:popular_movies/themes/themes_manager.dart';
import 'package:popular_movies/views/widgets/widgets.dart' show TextInfoCard;

class GridCardMovie extends StatelessWidget {
  const GridCardMovie({
    super.key,
    required this.movie,
    this.onTapAction,
  });

  final MovieModel movie;
  final Function()? onTapAction;

  @override
  Widget build(BuildContext context) {
    movie.heroId = 'home${movie.id}';
    return InkWell(
      child: GestureDetector(
        onTap: onTapAction,
        child: Container(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment(01, 0.1),
                end: Alignment.bottomCenter,
                colors: ThemeManager.colorsBoxCardDecoration,
              ),
              color: const Color(0xFF013a63),
              borderRadius: ThemeManager.borderCircularCard),
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: movie.heroId!,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: FadeInImage(
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(movie.fullBackdropPath),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextInfoCard(text: movie.title),
              TextInfoCard(text: '${movie.voteAverage}', fontSize: 14),
              const Expanded(
                child: SizedBox(),
              ),
              const TextInfoCard(
                  text: 'Ver más...', fontSize: 12, color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}
