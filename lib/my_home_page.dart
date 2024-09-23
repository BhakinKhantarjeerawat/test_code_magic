import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_code_magic/features/seconnd_screen/second_screen.dart';
import 'package:test_code_magic/features/third_screen/third_screen.dart';
import 'package:test_code_magic/features/udemy_pull_to_refresh.dart/pull_to_refresh_screen.dart';
import 'package:test_code_magic/global_function/my_navigate.dart';
import 'package:test_code_magic/providers/async_counter_provider.dart';
import 'package:test_code_magic/providers/counter_provider.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});
  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    print('MyHomePage BUILT1');
    final asyncCounter = ref.watch(asyncCounterProvider);
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('The third version by Bhakin'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer(
              builder: (context, ref, child) {
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                return asyncCounter.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stackTrace) =>
                      Center(child: Text(error.toString())),
                  data: (data) => Text(data.toString()),
                );
              },
            ),
            ElevatedButton(
                onPressed: () => myNavigate(context, const SecondScreen()),
                child: const Text('Second Screen')),
            ElevatedButton(
                onPressed: () => myNavigate(context, const ThirdScreen()),
                child: const Text('Third Screen')),
                          ElevatedButton(
                onPressed: () => myNavigate(context, const UserListPage()),
                child: const Text('UserListPage')),
            ElevatedButton(
                onPressed: () => ref.read(counterProvider.notifier).increase(5),
                child: const Text('A')),
            ElevatedButton(
                onPressed: () => ref.read(counterProvider.notifier).reduce(2),
                child: const Text('B')),
            ElevatedButton(
                onPressed: asyncCounter.isLoading
                    ? null
                    : () => ref.read(asyncCounterProvider.notifier).increase(2),
                child: const Text('async increase')),
            ElevatedButton(
                onPressed: asyncCounter.isLoading
                    ? null
                    : () => ref.read(asyncCounterProvider.notifier).reduce(2),
                child: const Text('async reduce')),
          ],
        ),
      ),
    );
  }
}
