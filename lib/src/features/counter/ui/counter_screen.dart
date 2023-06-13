import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodtutorialproject/src/app_routes_file.dart';

import '../providers/conter_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  static const route ='/counter';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:const Text("Auto - dispose counter app")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CounterLabel(),
            const CounterDisplay(),
            const SizedBox(
              height:20
            ),
            TimerCountdown(),
          ],
        ),
      ),
      floatingActionButton: const CounterIncrement(),
    );

  }
}

class CounterLabel extends ConsumerWidget {
  const CounterLabel({
    super.key,
});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Text("the const is ");
  }
}

class CounterDisplay extends ConsumerWidget {
  const CounterDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final counter = ref.watch(counterProvider);
    return Text("$counter");
  }
}

class CounterIncrement extends ConsumerWidget {
  const CounterIncrement({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed:() {
        ref.read(counterProvider.notifier).increment();
     //   ref.read(counterProvider.notifier).reset();
      },
      child:const Icon(Icons.add) ,
    );
  }
}

class TimerCountdown extends ConsumerWidget {
  TimerCountdown({super.key});

  final _numbers = numbers();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: _numbers,
        builder: (context,snapshot) {
      switch(snapshot.connectionState) {
        case ConnectionState.none:
        case ConnectionState.waiting:
        return const Center(
          child:CircularProgressIndicator()
        );
        case ConnectionState.active:
          return Text("Countdown: ${snapshot.data}");
        case ConnectionState.done:
          return Text("Done at : ${snapshot.data}");
        default:
          return Container();
      }
    }
    );

  }
}