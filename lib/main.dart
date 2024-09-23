import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_code_magic/log/riverpod_observer.dart';
import 'package:test_code_magic/my_home_page.dart';

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

