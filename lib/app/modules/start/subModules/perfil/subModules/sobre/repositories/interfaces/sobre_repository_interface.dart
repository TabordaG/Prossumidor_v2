import 'package:flutter_modular/flutter_modular.dart';

abstract class ISobreRepository implements Disposable {
  Future fetchPost();
}
