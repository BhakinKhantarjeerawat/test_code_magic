import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_code_magic/features/udemy_pull_to_refresh.dart/user.dart';
import '../../providers/dio_provider.dart';

part 'user_provider.g.dart';

// final userListProvider = FutureProvider.autoDispose<List<User>>((ref) async {
//   ref.onDispose(() {
//     print('[userListProvider] disposed');
//   });
//   final response = await ref.watch(dioProvider).get('/users');
//   // throw 'Fail to fetch user list';
//   final List userList = response.data;
//   final users = [for (final user in userList) User.fromJson(user)];
//   return users;
// });

@riverpod
FutureOr<List<User>> userList(UserListRef ref) async {
  ref.onDispose(() {
    print('[userListProvider] disposed');
  });
  await Future.delayed(const Duration(seconds: 2));
  // final response = await ref.watch(dioProvider).get('/users');
  // throw 'Fail to fetch user list';
  // final List userList = response.data;
  // final users = [for (final user in userList) User.fromJson(user)];
  final users = [
    const User(
        id: 1,
        name: 'name',
        username: 'username',
        email: 'email',
        phone: 'phone',
        website: 'website'),
    const User(
        id: 1,
        name: 'name',
        username: 'username',
        email: 'email',
        phone: 'phone',
        website: 'website'),
    const User(
        id: 1,
        name: 'name',
        username: 'username',
        email: 'email',
        phone: 'phone',
        website: 'website')
  ];
  return users;
}

// final userDetailProvider =
//     FutureProvider.autoDispose.family<User, int>((ref, id) async {
//   ref.onDispose(() {
//     print('[userDetailProvider($id)] disposed');
//   });
//   final response = await ref.watch(dioProvider).get('/users/$id');
//   final user = User.fromJson(response.data);
//   return user;
// });

@riverpod
FutureOr<User> userDetail(UserDetailRef ref, int id) async {
  ref.onDispose(() {
    print('[userDetailProvider($id)] disposed');
  });
  final response = await ref.watch(dioProvider).get('/users/$id');
  ref.keepAlive();
  final user = User.fromJson(response.data);
  return user;
}

@Riverpod(keepAlive: false)
FutureOr<int> returnOne(ReturnOneRef ref) {
  ref.keepAlive();
  return Future.value(1);
}
