import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodtutorialproject/src/app_routes_file.dart';

import '../data/providers/movies_provider.dart';
import 'movie_box.dart';



class MoviesScreen extends ConsumerWidget {
  const MoviesScreen({super.key});

  static const route ="/movies";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(moviesFutureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        elevation: 0,
        centerTitle: true,
      ),
      body:Container(
        padding: const EdgeInsets.only(top:12),
        child: movies.when(
          data: (data) {
            return RefreshIndicator( onRefresh: () async {
              ref.refresh(moviesFutureProvider);
            },
              child: GridView.extent(maxCrossAxisExtent: 200,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.8,
              children: data.map((movie)=>MovieBox(movie:movie)).toList(),
              ),
            );
          },
          error: (error,_) {
            return Text("Error "+error.toString());
          },
          loading: () =>const Center(
          child:CircularProgressIndicator()
        ),
        ),
      )
    );
  }
}