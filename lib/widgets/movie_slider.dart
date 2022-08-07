import 'package:flutter/material.dart';

class MovieSliderScreen extends StatelessWidget {
  const MovieSliderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Populares',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (_, int index) => _moviePoster()),
            )
          ],
        ),
      ),
    );
  }
}

StatelessWidget _moviePoster() {
  return Container(
      width: 130,
      height: 190,
      color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: const [
        FadeInImage(
          image: NetworkImage('https://picsum.photos/200/300'),
          placeholder: AssetImage('assets/img/no-image.jpg'),
          fit: BoxFit.cover,
          height: 150,
        ),
      ]));
}
