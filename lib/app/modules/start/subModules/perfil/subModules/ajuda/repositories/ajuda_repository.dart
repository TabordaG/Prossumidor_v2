import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interfaces/ajuda_repository_interface.dart';

part 'ajuda_repository.g.dart';

@Injectable()
class AjudaRepository implements IAjudaRepository {
  final DioForNative client;

  AjudaRepository(this.client);

  @override
  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
