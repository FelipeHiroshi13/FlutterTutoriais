import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider/future_provider.dart';

class SecondScreen extends ConsumerWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Segunda tela'),
      ),
      body: Center(
        child: ref.watch(countFutureProvider).when(
              data: (count) => Text(count.toString()),
              error: (error, st) => Text(error.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
      ),
    );
  }
}
