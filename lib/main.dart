import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodtutorialproject/src/app_routes_file.dart';
import 'package:riverpodtutorialproject/src/contants.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(Constants.settingsStorageKey); // settings
  await Hive.openBox(Constants.authStorageKey);
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
