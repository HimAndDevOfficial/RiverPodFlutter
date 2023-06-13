import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodtutorialproject/src/app_routes_file.dart';

import '../../../features/counter/ui/counter_screen.dart';
import '../models/entry.dart';

final homeMenuEnteriesProvider = StateProvider<List<Entry>>((ref) {

  return [
    Entry(
    title:'Counter App',
     icon: const Icon(Icons.timer),
     route:CounterScreen.route,
     ),
    // Entry(
    //   title:'Calculator',
    //   icon: const Icon(Icons.timer),
    //   route:CalculatorScreen.route,
    // ),
    // Entry(
    //   title:'Network Status',
    //   icon: const Icon(Icons.timer),
    //   route:NetworkStatusScreen.route,
    // ),
  ];
});