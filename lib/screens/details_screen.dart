import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-null';
    return const Scaffold(body: CustomScrollView(slivers: [_CustomAppBar()]));
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
