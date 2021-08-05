import 'package:flutter_modular/flutter_modular.dart';

abstract class IChatRepository implements Disposable {
  Future buscaMensagens(int id);
}
