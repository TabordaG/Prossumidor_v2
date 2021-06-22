import 'package:flutter_modular/flutter_modular.dart';

abstract class IAjudaRepository implements Disposable {
  Future fetchPost();
}
