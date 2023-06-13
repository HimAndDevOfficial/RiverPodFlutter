import 'package:flutter/material.dart';

final Map<String , Widget Function(BuildContext)> appRoutes = {
  HomeScreen.route:(context) => const HomeScreen(),
  NetworkStatusScreen.route :(context)=>  NetworkStatusScreen()
};

Route<dynamic>? appGeneratedRoutes(RouteSettings settings) {
  switch (settings.name) {

  }
}