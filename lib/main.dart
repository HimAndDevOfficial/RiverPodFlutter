import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodtutorialproject/src/app_routes_file.dart';

void main() {
  runApp(const ProviderScope(child:MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   //final theme = ref.watch(themeProvider);

   return MaterialApp(
     debugShowCheckedModeBanner: false,
     initialRoute: '/',
     routes:appRoutes,
     onGenerateRoute: (settings) =>appGeneratedRoutes(settings),
     // onUnknownRoute: (settings) => MaterialPageRoute(builder: (context)=> ErrorScreen(
     //   name:settings.name,
     // )),
   );

  }
}
