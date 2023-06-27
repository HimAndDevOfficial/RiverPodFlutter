import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodtutorialproject/src/app_routes_file.dart';

import '../../../features/auth/ui/auth_screen.dart';
import '../../../features/counter/ui/counter_screen.dart';
import '../../../features/movies/ui/movies_screen.dart';
import '../models/entry.dart';

final homeMenuEnteriesProvider = StateProvider<List<Entry>>((ref) {

  return [
    Entry(
    title:'Counter App',
     icon: const Icon(Icons.timer),
     route:CounterScreen.route,
     ),
    Entry(
      title:'Movie',
      icon: const Icon(Icons.movie),
      route:MoviesScreen.route,
    ),
    Entry(
      title: 'Auth',
      icon: const Icon(Icons.home),
      route: AuthScreen.route,
    ),
    // Entry(
    //   title:'Network Status',
    //   icon: const Icon(Icons.timer),
    //   route:NetworkStatusScreen.route,
    // ),
  ];
});