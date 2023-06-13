import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodtutorialproject/src/app_routes_file.dart';


final counterProvider = StateNotifierProvider.autoDispose((ref) =>Counter());

//StateNotifier is class provided by riverpod that manage state and notify listener when state changes
//It works well with providers like above statenotifier provider to provide reactive programming approach
class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment() => state++;

  // void reset() =>state=0;
}

Stream<int> numbers() =>
    Stream.periodic(const Duration(seconds:1), (e)=> e+1).take(10);

