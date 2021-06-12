import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:prossumidor_v2/app/modules/start/subModules/home/subModules/produtosCategorias/repositories/interfaces/produtos_categorias_repository_interface.dart';

class MockClient extends Mock implements Dio {}

void main() {
  // ignore: unused_local_variable
  IProdutosCategoriasRepository repository;
  // MockClient client;

  setUp(() {
    // client = MockClient();
    // repository = ProdutosCategoriasRepository(client);
  });

  group('ProdutosCategoriasRepository Test', () {
    //  test("First Test", () {
    //    expect(repository, isInstanceOf<ProdutosCategoriasRepository>());
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
