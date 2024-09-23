// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_api_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$testApiHash() => r'311b15afef24751d76bad1b57aad0264f1049513';

/// See also [testApi].
@ProviderFor(testApi)
final testApiProvider = AutoDisposeProvider<TestApi>.internal(
  testApi,
  name: r'testApiProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$testApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TestApiRef = AutoDisposeProviderRef<TestApi>;
String _$fetchDataFromApiHash() => r'16f1b41bd0f5279b755e4c8aa1a20a2250b5a2f8';

/// See also [fetchDataFromApi].
@ProviderFor(fetchDataFromApi)
final fetchDataFromApiProvider = AutoDisposeFutureProvider<CatFact>.internal(
  fetchDataFromApi,
  name: r'fetchDataFromApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchDataFromApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchDataFromApiRef = AutoDisposeFutureProviderRef<CatFact>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
