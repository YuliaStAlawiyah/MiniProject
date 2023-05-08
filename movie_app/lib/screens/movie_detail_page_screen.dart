import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_app/providers/movie_detail_provider.dart';
import 'package:provider/provider.dart';

import '../injector.dart';

class MovieDetailPageScreen extends StatelessWidget {
  const MovieDetailPageScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => sl<MovieDetailProvider>()..getDetail(context, id: id),
      builder: (_, __) => Scaffold(
        body: CustomScrollView(
          slivers: [
            Consumer<MovieDetailProvider>(
              builder: (_, Provider, __) {
                if (Provider.movie != null) {
                  log(Provider.movie.toString());
                }
                return SliverAppBar(
                  title:
                      Text(Provider.movie != null ? Provider.movie!.title : ''),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
