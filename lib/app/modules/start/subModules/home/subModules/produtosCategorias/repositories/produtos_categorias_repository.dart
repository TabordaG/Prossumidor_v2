import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interfaces/produtos_categorias_repository_interface.dart';

part 'produtos_categorias_repository.g.dart';

@Injectable()
class ProdutosCategoriasRepository implements IProdutosCategoriasRepository {
  final DioForNative client;

  ProdutosCategoriasRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
