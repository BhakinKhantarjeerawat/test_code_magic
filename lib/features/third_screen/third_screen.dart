import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
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
        body: RefreshIndicator(
          onRefresh: () async {
            print('RefreshIndicator CALLED');
            return ref.refresh(fetchDataFromApiProvider.future);
            // ref.invalidate(fetchDataFromApiProvider);
          },
          child: Stack(
            children: [
              ListView(),
              testApi.when(
                skipLoadingOnRefresh: true,
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) => Text(error.toString()),
                data: (data) => Container(
                    color: Colors.blue,
                    // height: 300,
                    child: Text(data.toString())

                    // child: ListView(children: [
                    //   Text(data.toString()),
                    //   Text(data.toString()),
                    // ]),

                    ),
              ),
              ElevatedButton(
                  onPressed: () {
                    print('refresh PRESSED');
                    // ref.refresh(fetchDataFromApiProvider.future);
                    ref.invalidate(fetchDataFromApiProvider);
                  },
                  child: const Text('Refresh')),
            ],
          ),
        ));
  }
}
