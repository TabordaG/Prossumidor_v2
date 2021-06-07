import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interfaces/login_repository_interface.dart';

part 'login_repository.g.dart';

@Injectable()
class LoginRepository implements ILoginRepository {
  final DioForNative client;

  LoginRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
