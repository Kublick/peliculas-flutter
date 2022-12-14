import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class CardSwiperScreen extends StatelessWidget {
  const CardSwiperScreen({Key? key, required this.movies}) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: Swiper(
          itemCount: movies.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.4,
          itemBuilder: (BuildContext context, int index) {
            final movie = movies[index];
            final uniquekey = movies[index].heroId = UniqueKey().toString();

            return GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, 'details', arguments: movie),
              child: Hero(
                tag: uniquekey,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                      placeholder: const AssetImage('assets/no-image.jpg'),
                      image: NetworkImage(movie.fullPosterImg),
                      fit: BoxFit.cover),
                ),
              ),
            );
          },
        ));
  }
}
