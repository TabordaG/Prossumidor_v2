import 'package:flutter_modular/flutter_modular.dart';

abstract class IAuthRepository implements Disposable {
  Future buscarVersao();
  Future buscarUsuario(String email);
  Future buscaUsuarioCompleto(int id);
  Future localRetirada(String email);
  Future buscaMensagens(int id);
}
