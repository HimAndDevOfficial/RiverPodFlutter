import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodtutorialproject/src/app_routes_file.dart';



class MoviesScreen extends ConsumerWidget {
  const MoviesScreen({super.key});

  static const route ="/movies";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(movieFutureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        elevation: 0,
        centerTitle: true,
      ),
      body:Container(
        padding: const EdgeInsets.only(top:12),
        child: movies.whe,
      )
    )
  }
}