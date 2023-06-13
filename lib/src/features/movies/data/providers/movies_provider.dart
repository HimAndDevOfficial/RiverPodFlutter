import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodtutorialproject/src/app_routes_file.dart';

import '../repository/movie_repository.dart';


final moviesFutureProvider =
    FutureProvider.autoDispose<List<Movie>>((ref) async {
      ref.keepAlive() ;


      final movieservice = ref.watch(movieServiceProvider);
      final movies = await movieService.getMovies();
      return movies;
    });

final moviesPaginationNotifierProvider = StateNotifierProvider((ref)  {
    final movieService = ref.watch(movieServiceProvider);
    return MoviePaginationNotifier(movieService);
});

class MoviePaginationNotifier extends StateNotifier<MoviePagination> {
  final MovieRepository _service;

  MoviePaginationNotifier(
      this._service, [
        MoviePagination? state,
  ]) : super(state ?? MoviePagination.initial()) {
    getMovies();
  }

  Future<void> getMovies() async {
    try {
      final movie = await _service.getMovies(state.page);
      state = state.copyWith(movies: [...state.movies, ...movies], page: state.page+1)
    } on MoviesException catch(e) {
      state = state.copyWith(errorMessage: e.message);
    }

  }
}