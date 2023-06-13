import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodtutorialproject/src/app_routes_file.dart';

class Entry {
  String title;
  Icon icon;
  String route;

  Entry({required this.title, required this.icon, required this.route});
}