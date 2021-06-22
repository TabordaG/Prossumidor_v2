import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interfaces/sobre_repository_interface.dart';

part 'sobre_repository.g.dart';

@Injectable()
class SobreRepository implements ISobreRepository {
  final DioForNative client;

  SobreRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
