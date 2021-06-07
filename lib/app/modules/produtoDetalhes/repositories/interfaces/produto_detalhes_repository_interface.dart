import 'package:flutter_modular/flutter_modular.dart';

abstract class IProdutoDetalhesRepository implements Disposable {
  Future fetchPost();
}
