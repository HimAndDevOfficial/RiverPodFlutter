import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodtutorialproject/src/app_routes_file.dart';

import '../data/models/movie.dart';
import '../data/providers/movies_provider.dart';

class MovieBox extends StatelessWidget {

  final Movie movie;

  const MovieBox({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        ClipRect(
          child: Image.network(movie.fullImageUrl,
          fit:BoxFit.cover,
          width: double.infinity,),
        ),
        Positioned(
          bottom: 0,
          left:0,
          right:0,
          child: Text(movie.title),
        )
      ],
    );
  }

}