import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodtutorialproject/src/app_routes_file.dart';

import '../environment_config.dart';
import '../models/movie.dart';

const String moviesUrl ="https://api.themoviedb.org/3/movie";

final movieServiceProvider = Provider<MovieRepository>((ref) {
  final config = ref.watch(environmentConfigProvider);

  return MovieRepository(config,Dio());
});

class MovieRepository {

  final EnvironmentConfig _environmentConfig;
  final Dio _dio;
  MovieRepository(this._environmentConfig,this._dio);

  Future<List<Movie>> getMovies([int page =1]) async {
    try {
      final url = '$moviesUrl/popular?api_key=${_environmentConfig.movieApiKey}&language=en-US';
      final response = await _dio.get(url);

      final results = List<Map<String, dynamic>>.from(response.data['results'] as Iterable);

      List<Movie> movies =
          results.map((e)=> Movie.fromMap(e)).toList(growable:false);

      return movies;
    } on DioError catch (e) {
      throw e;
    } catch(e) {
      throw Exception(e.toString());
    }
  }
}