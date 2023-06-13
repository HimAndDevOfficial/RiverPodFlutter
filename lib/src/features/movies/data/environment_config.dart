import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodtutorialproject/src/app_routes_file.dart';

class EnvrironmentConfig {

  final movieApiKey = "gffggfg";
}

final environmentConfigPorivder =
    Provider<EnvrironmentConfig>((ref)=> EnvrironmentConfig());