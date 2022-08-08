import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class MovieSliderScreen extends StatefulWidget {
  const MovieSliderScreen(
      {Key? key, required this.movies, this.title, required this.onNextPage})
      : super(key: key);

  final List<Movie> movies;
  final String? title;
  final Function onNextPage;

  @override
  State<MovieSliderScreen> createState() => _MovieSliderScreenState();
}

class _MovieSliderScreenState extends State<MovieSliderScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

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
            widget.title != null
                ? Text(
                    widget.title!,
                    style: Theme.of(context).textTheme.headline6,
                  )
                : const SizedBox(),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.movies.length,
                  itemBuilder: (context, int index) {
                    final movie = widget.movies[index];
                    return _moviePoster(context, movie,
                        '${widget.title} -$index - ${widget.movies[index].id}  ');
                  }),
            )
          ],
        ),
      ),
    );
  }
}

StatelessWidget _moviePoster(BuildContext context, Movie movie, String heroId) {
  movie.heroId = heroId;
  return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, 'details', arguments: movie),
          child: Hero(
            tag: movie.heroId!,
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
