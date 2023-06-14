import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodtutorialproject/src/app_routes_file.dart';

import '../repository/movie_repository.dart';

class Movie {
  final String title;
  final String image;

  Movie({required this.title,
  required this.image});

  String get fullImageUrl => 'https://image.tmdb.org/t/p/w500$image';

  Movie copyWith({
  String? title,
   String? image,
}) {
    return Movie(
      title:title ?? this.title,
      image:image ?? this.image,
    );
  }

  Map<String,dynamic> toMap() {
    return <String,dynamic> {
      'title' : title,
      'image' :image,
    };
  }

  factory Movie.fromMap(Map<String,dynamic> map) {
    return Movie(
      title: map['title'] as String,
      image:map['poster_path'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String,dynamic>);

  @override
  String toString() => 'Movie(title:$title, image: $image)';

  @override
  bool operator ==(covariant Movie other) {
    if(identical(this,other)) return true;

    return other.title == title && other.image==image;
  }

  @override
  int get hashCode => title.hashCode ^ image.hashCode;

}
