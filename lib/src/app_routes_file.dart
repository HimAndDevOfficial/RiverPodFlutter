import 'package:flutter/material.dart';
import 'package:riverpodtutorialproject/src/features/counter/ui/counter_screen.dart';

import 'features/movies/ui/movies_screen.dart';
import 'home/ui/home_screen.dart';

final Map<String , Widget Function(BuildContext)> appRoutes = {
  HomeScreen.route:(context) => const HomeScreen(),
  CounterScreen.route:(context) => const CounterScreen(),
  MoviesScreen.route:(context) => const MoviesScreen()
  // NetworkStatusScreen.route :(context)=>  NetworkStatusScreen()
};

Route<dynamic>? appGeneratedRoutes(RouteSettings settings) {
  switch (settings.name) {

  }
  return null;
}