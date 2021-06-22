import 'package:flutter_modular/flutter_modular.dart';

abstract class IMeusDadosRepository implements Disposable {
  Future fetchPost();
}
