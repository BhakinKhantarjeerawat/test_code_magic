import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_code_magic/providers/test_api_provider.dart';
import 'package:test_code_magic/widgets/async_value_widget.dart';

class ThirdScreen extends ConsumerWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testApi = ref.watch(fetchDataFromApiProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('ThirdScreen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AsyncValueWidget(value: testApi, data: (data) => Text(data.toString()))
            ],
          ),
        ));
  }
}
