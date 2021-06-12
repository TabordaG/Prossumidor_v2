import 'package:flutter_modular/flutter_modular.dart';

abstract class IProdutosCategoriasRepository implements Disposable {
  Future fetchPost();
}
