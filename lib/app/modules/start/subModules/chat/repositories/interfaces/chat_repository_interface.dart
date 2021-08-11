import 'package:flutter_modular/flutter_modular.dart';

abstract class IChatRepository implements Disposable {
  Future buscaMensagens(int id);
  Future iniciaChat(int id, int offset);
  Future buscaUltimaMensagem(int id, String string);
}
