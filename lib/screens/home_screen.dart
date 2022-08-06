import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Peliculas en Cines'),
          elevation: 0,
          actions: const [
            IconButton(onPressed: null, icon: Icon(Icons.search_outlined))
          ],
        ),
        body: Column(
          children: const [
            CardSwiperScreen(),

            // TODO Listado Horizontal de peliculas
          ],
        ));
  }
}
