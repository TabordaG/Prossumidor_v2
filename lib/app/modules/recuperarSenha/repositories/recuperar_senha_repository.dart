import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interfaces/recuperar_senha_repository_interface.dart';

part 'recuperar_senha_repository.g.dart';

@Injectable()
class RecuperarSenhaRepository implements IRecuperarSenhaRepository {
  final DioForNative client;

  RecuperarSenhaRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
