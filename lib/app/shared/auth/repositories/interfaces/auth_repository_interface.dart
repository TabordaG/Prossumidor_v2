import 'package:flutter_modular/flutter_modular.dart';

abstract class IAuthRepository implements Disposable {
  Future fetchPost();
}
