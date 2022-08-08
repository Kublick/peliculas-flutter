import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    final popularMovies = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Peliculas en Cines'),
          elevation: 0,
          actions: const [
            IconButton(onPressed: null, icon: Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardSwiperScreen(movies: moviesProvider.onDisplayMovies),
              MovieSliderScreen(
                  movies: popularMovies.popularMovies, title: 'Populares!'),
            ],
          ),
        ));
  }
}
