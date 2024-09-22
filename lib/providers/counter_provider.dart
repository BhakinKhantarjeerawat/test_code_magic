import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

@riverpod
class Counter  extends _$Counter {
    @override
  int build() {
    return 0;
  }
  void increase(int number) async {
    state+=number;
  }
    void reduce(int number) async {
    state-=number;
  }

}
