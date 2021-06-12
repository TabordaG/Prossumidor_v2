import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:prossumidor_v2/app/modules/start/subModules/chat/repositories/interfaces/chat_repository_interface.dart';

class MockClient extends Mock implements Dio {}

void main() {
  // ignore: unused_local_variable
  IChatRepository repository;
  // MockClient client;

  setUp(() {
    // client = MockClient();
    // repository = ChatRepository(client);
  });

  group('ChatRepository Test', () {
    //  test("First Test", () {
    //    expect(repository, isInstanceOf<ChatRepository>());
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
