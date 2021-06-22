import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/sobre/repositories/interfaces/sobre_repository_interface.dart';

class MockClient extends Mock implements Dio {}

void main() {
  ISobreRepository repository;
  // MockClient client;

  setUp(() {
    // client = MockClient();
    // repository = SobreRepository(client);
  });

  group('SobreRepository Test', () {
    //  test("First Test", () {
    //    expect(repository, isInstanceOf<SobreRepository>());
    //  });

    test('returns a Post if the http call completes successfully', () async {
      //    when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
      //        .thenAnswer((_) async =>
      //            Response(data: {'title': 'Test'}, statusCode: 200));
      //    Map<String, dynamic> data = await repository.fetchPost(client);
      //    expect(data['title'], 'Test');
    });
  });
}
