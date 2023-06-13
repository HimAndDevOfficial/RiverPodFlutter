import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodtutorialproject/src/app_routes_file.dart';

const String moviesUrl ="";

final movieServiceProvider = Provider<MovieRepository>((ref) {
  final config = ref.watch(environmentConfigProvider);

  return MoviesRepository(config,Dio());
});

class MovieRepository {

  final EnvironmentConfig _environmentConfig;
  final Dio _dio;
  MovieRepository(this._environmentConfig,this._dio);

  Future<List<Movie>> getMovies([int page =1]) async {
    try {
      final url = '$moviesUrl/?api_key=${_environmentConfig.movieApiKey}&language=en-US&page=$page';
      final response = await _dio.get(url);

      final result = List<Map<String, dynamic>>.from(response.data['result'] as Iterable);

      List<Movie> movies =
          results.map((e)=> Movie.fromMap(e)).toList(growable:false);

      return movies;
    } on DioError catch e {
      throw MoviesException.fromDioError(e);
    } catch(e) {
      throw Exception(e.toString());
    }
  }
}