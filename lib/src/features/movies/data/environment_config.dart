import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodtutorialproject/src/app_routes_file.dart';

class EnvironmentConfig {

  final movieApiKey = "29c764f51f8a808ae741485fb442fcc7";
}

final environmentConfigProvider =
    Provider<EnvironmentConfig>((ref)=> EnvironmentConfig());