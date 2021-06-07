import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interfaces/perfil_repository_interface.dart';

part 'perfil_repository.g.dart';

@Injectable()
class PerfilRepository implements IPerfilRepository {
  final DioForNative client;

  PerfilRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
