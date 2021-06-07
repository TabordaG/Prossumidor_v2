import 'package:flutter_modular/flutter_modular.dart';

abstract class ISacolaRepository implements Disposable {
  Future fetchPost();
}
