import 'package:flutter/material.dart';
import 'package:movie_app/components/movie_discover_component.dart';
import 'package:movie_app/components/movie_top_rated_component.dart';

class BerandaPageScreen extends StatefulWidget {
  const BerandaPageScreen({super.key});

  @override
  State<BerandaPageScreen> createState() => _BerandaPageScreenState();
}

class _BerandaPageScreenState extends State<BerandaPageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                const Text('Movie App'),
              ],
            ),
            floating: true,
            snap: true,
            centerTitle: true,
            backgroundColor: Colors.blueGrey,
            foregroundColor: Colors.greenAccent,
          ),
          const _WidgetTitle(title: 'Discaver Movies'),
          const MovieDiscaverComponent(),
          const _WidgetTitle(title: 'Top Rated Movies'),
          const MovieTopRatedComponent(),
        ],
      ),
    );
  }
}

class _WidgetTitle extends SliverToBoxAdapter {
  final String title;

  const _WidgetTitle({required this.title});

  @override
  Widget? get child => Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      );
}
