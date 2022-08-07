import 'package:flutter/material.dart';

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
        delegate: SliverChildListDelegate([const _PosterAndTitle()]),
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
