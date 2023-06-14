import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodtutorialproject/src/app_routes_file.dart';

import '../models/movie.dart';
import '../repository/movie_repository.dart';


final moviesFutureProvider =
    FutureProvider.autoDispose<List<Movie>>((ref) async {
      ref.keepAlive() ;


      final movieService = ref.watch(movieServiceProvider);
      final movies = await movieService.getMovies();
      return movies;
    });
