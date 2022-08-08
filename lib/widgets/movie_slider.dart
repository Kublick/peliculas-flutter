import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class MovieSliderScreen extends StatelessWidget {
  const MovieSliderScreen({Key? key, required this.movies, this.title})
      : super(key: key);

  final List<Movie> movies;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title != null
                ? Text(
                    title!,
                    style: Theme.of(context).textTheme.headline6,
                  )
                : const SizedBox(),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, int index) {
                    final movie = movies[index];
                    return _moviePoster(context, movie);
                  }),
            )
          ],
        ),
      ),
    );
  }
}

StatelessWidget _moviePoster(BuildContext context, Movie movie) {
  return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'details',
              arguments: 'movie-instance'),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              image: NetworkImage(movie.fullPosterImg),
              placeholder: const AssetImage('assets/no-image.jpg'),
              fit: BoxFit.cover,
              height: 190,
              width: 130,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          movie.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        )
      ]));
}
