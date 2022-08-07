import 'package:flutter/material.dart';

class MovieSliderScreen extends StatelessWidget {
  const MovieSliderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Populares',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, int index) => _moviePoster(context)),
            )
          ],
        ),
      ),
    );
  }
}

StatelessWidget _moviePoster(BuildContext context) {
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
            child: const FadeInImage(
              image: NetworkImage('https://picsum.photos/300/400'),
              placeholder: AssetImage('assets/no-image.jpg'),
              fit: BoxFit.cover,
              height: 190,
              width: 130,
            ),
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'StarWars StarWars StarWars',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        )
      ]));
}
