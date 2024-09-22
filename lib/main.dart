import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_code_magic/global_function/my_navigate.dart';
import 'package:test_code_magic/log/riverpod_observer.dart';
import 'package:test_code_magic/providers/async_counter_provider.dart';
import 'package:test_code_magic/providers/counter_provider.dart';
import 'package:test_code_magic/second_screen.dart';
import 'package:test_code_magic/third_screen.dart';

void main() {
  runApp(ProviderScope(observers: [
    RiverpodObserver(),
  ], overrides: const [
    // sharedPreferencesProvider.overrideWithValue(sharedPreferences)
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.lightGreen),
      home: const MyHomePage(),
    );
  }
}

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
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // floatingActionButton: Column(
      //   children: [
      //     FloatingActionButton(
      //       onPressed: () => ref.read(counterProvider.notifier).increase(5),
      //       tooltip: 'A',
      //       child: const Icon(Icons.add),
      //     ),
      //     FloatingActionButton(
      //       onPressed: () => ref.read(counterProvider.notifier).reduce(2),
      //       tooltip: 'B',
      //       child: const Icon(Icons.delete),
      //     ),
      //     FloatingActionButton(
      //       onPressed: asyncCounter.isLoading
      //           ? null
      //           : () => ref.read(asyncCounterProvider.notifier).increase(2),
      //       tooltip: 'Async Increment',
      //       child: const Icon(Icons.add),
      //     ),
      //     FloatingActionButton(
      //       onPressed: () => ref.read(asyncCounterProvider.notifier).reduce(1),
      //       tooltip: 'Async reduce',
      //       child: const Icon(Icons.delete),
      //     ),
      //   ],
      // ),
    );
  }
}
