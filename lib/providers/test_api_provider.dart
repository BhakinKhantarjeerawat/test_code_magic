import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_code_magic/features/test_api/model/cat_fact.dart';
import 'package:test_code_magic/providers/dio_provider.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

part 'test_api_provider.g.dart';

class TestApi {
  TestApi({required this.dio});
  final Dio dio;

  Future<CatFact> fetchDataFromApi() async {
    const path = 'https://catfact.ninja/fact?max_length=140';

    final dioAdapter = DioAdapter(dio: dio);

    dioAdapter.onGet(
      path,
      (server) => server.reply(
        200,
        // {'message': 'Bhakin's Success!'},
        {"fact": "My edited cat fact", "length": 63},
        delay: const Duration(seconds: 5),
      ),
    );

    final response = await dio.get(path);
    final object = CatFact.fromJson(response.data);
    return object;
  }
}

@riverpod
TestApi testApi(TestApiRef ref) {
  final dio = ref.watch(dioProvider);
  return TestApi(dio: dio);
}

@riverpod
Future<CatFact> fetchDataFromApi(FetchDataFromApiRef ref) {
  final testApi = ref.watch(testApiProvider);
  final object = testApi.fetchDataFromApi();
  return object;
}
