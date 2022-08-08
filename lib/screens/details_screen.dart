import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-null';
    return Scaffold(
        body: CustomScrollView(slivers: [
      const _CustomAppBar(),
      SliverList(
        delegate: SliverChildListDelegate([
          const _PosterAndTitle(),
          _OverView(),
          const CastingCards(),
        ]),
      )
    ]));
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    Key? key,
  }) : super(key: key);

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
            padding: const EdgeInsets.only(bottom: 10),
            alignment: Alignment.bottomCenter,
            color: Colors.black12,
            width: double.infinity,
            child: const Text('movie-Title', style: TextStyle(fontSize: 16)),
          ),
          background: const FadeInImage(
              image: NetworkImage('https://picsum.photos/300/400'),
              placeholder: AssetImage('assets/loading.gif'),
              fit: BoxFit.cover)),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const FadeInImage(
                  image: NetworkImage('https://picsum.photos/200/300'),
                  placeholder: AssetImage('assets/no-image.jpg'),
                  height: 150,
                )),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'movie-title',
                  style: textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  'movie.originalTitle',
                  style: textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Row(
                  children: [
                    const Icon(Icons.star_outline,
                        size: 15, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text('movie.voteAverage', style: textTheme.caption)
                  ],
                )
              ],
            )
          ],
        ));
  }
}

class _OverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: (Text(
            'In do laborum esse adipisicing est tempor amet deserunt mollit. Ullamco ex nisi enim culpa proident exercitation. Aliqua est ullamco ut do cupidatat velit culpa ex nostrud pariatur velit ex ullamco id. Ea officia adipisicing excepteur excepteur dolore dolor exercitation cupidatat aute non. Ipsum ut ullamco aute esse anim.',
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.subtitle1)));
  }
}
