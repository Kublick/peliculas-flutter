import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    final int movieId = movie.id;

    return Scaffold(
        body: CustomScrollView(slivers: [
      _CustomAppBar(movie),
      SliverList(
        delegate: SliverChildListDelegate([
          _PosterAndTitle(movie),
          _OverView(movie),
          CastingCards(movieId: movieId),
        ]),
      )
    ]));
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar(
    this.movie,
  );

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          titlePadding: const EdgeInsets.all(0),
          title: Container(
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            alignment: Alignment.bottomCenter,
            color: Colors.black12,
            width: double.infinity,
            child: Text(
              movie.title,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          background: FadeInImage(
              image: NetworkImage(movie.fullbackdropPath),
              placeholder: const AssetImage('assets/loading.gif'),
              fit: BoxFit.cover)),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle(this.movie);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    final Size size = MediaQuery.of(context).size;

    return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                    image: NetworkImage(movie.fullPosterImg),
                    placeholder: const AssetImage('assets/no-image.jpg'),
                    height: 150,
                  )),
            ),
            const SizedBox(width: 20),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.width * 0.65),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: textTheme.headline5,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    movie.originalTitle,
                    style: textTheme.subtitle1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star_outline,
                          size: 15, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text(movie.voteAverage.toString(),
                          style: textTheme.caption)
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class _OverView extends StatelessWidget {
  const _OverView(this.movie);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: (Text(movie.overview,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.subtitle1)));
  }
}
