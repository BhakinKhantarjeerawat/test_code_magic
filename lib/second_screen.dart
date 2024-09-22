import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_code_magic/providers/async_counter_provider.dart';
import 'package:test_code_magic/providers/counter_provider.dart';
import 'package:test_code_magic/widgets/async_value_widget.dart';

class SecondScreen extends ConsumerWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('secondScreen BUILT');
    final asyncCounter = ref.watch(asyncCounterProvider);
    final counter = ref.watch(counterProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(counter.toString()),
              // asyncCounter.when(loading: () => const Center(child: CircularProgressIndicator()),
              // error:(error, stackTrace) => Center(child: Text(error.toString())),
              // data: (data) => Text(data.toString()),
              // ),
              AsyncValueWidget(
                  value: asyncCounter, data: (data) => Text(data.toString()))
            ],
          ),
        ));
  }
}
