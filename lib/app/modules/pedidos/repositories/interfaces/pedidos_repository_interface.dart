import 'package:flutter_modular/flutter_modular.dart';

abstract class IPedidosRepository implements Disposable {
  Future fetchPost();
}
