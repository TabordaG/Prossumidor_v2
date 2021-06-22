import 'package:flutter_modular/flutter_modular.dart';

abstract class IEnderecoRepository implements Disposable {
  Future fetchPost();
}
