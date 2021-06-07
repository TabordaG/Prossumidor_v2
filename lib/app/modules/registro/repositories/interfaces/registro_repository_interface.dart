import 'package:flutter_modular/flutter_modular.dart';

abstract class IRegistroRepository implements Disposable {
  Future fetchPost();
}
