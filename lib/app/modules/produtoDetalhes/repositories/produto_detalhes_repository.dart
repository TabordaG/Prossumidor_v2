import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interfaces/produto_detalhes_repository_interface.dart';

part 'produto_detalhes_repository.g.dart';

@Injectable()
class ProdutoDetalhesRepository implements IProdutoDetalhesRepository {
  final DioForNative client;

  ProdutoDetalhesRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
