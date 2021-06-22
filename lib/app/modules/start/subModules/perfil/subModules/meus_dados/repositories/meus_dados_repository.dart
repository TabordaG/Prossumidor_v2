import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interfaces/meus_dados_repository_interface.dart';

part 'meus_dados_repository.g.dart';

@Injectable()
class MeusDadosRepository implements IMeusDadosRepository {
  final DioForNative client;

  MeusDadosRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
