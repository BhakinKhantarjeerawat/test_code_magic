import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'async_counter_provider.g.dart';

@riverpod
class AsyncCounter extends _$AsyncCounter {
  @override
  Future<int> build() async {
    await Future.delayed(const Duration(seconds: 2));
    return 0;
  }

  void increase(int number) async {
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(seconds: 2));
    state = await AsyncValue.guard(() async {
      return state.value! +1;
    });
  }

  void reduce(int number) async {
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(seconds: 2));
    state = await AsyncValue.guard(() async {
      return state.value! -1;
    });
  }
}
