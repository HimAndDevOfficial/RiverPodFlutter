import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodtutorialproject/src/app_routes_file.dart';

import '../data/providers/home_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  static const route ='/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final homeMenuEnteries = ref.watch(homeMenuEnteriesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("home screen"),
      ),
      body: ListView(
        children: [
          Column(
            children: homeMenuEnteries.map(
                (item) =>ListTile(
                  title:Text(item.title),
                  leading:item.icon,
                  trailing:const Icon(Icons.chevron_right),
                  onTap: ()=>Navigator.pushNamed(context, item.route),
                )
            ).toList()
          )
        ],
      )
    );
  }
}