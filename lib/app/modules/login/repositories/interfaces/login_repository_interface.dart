import 'package:flutter_modular/flutter_modular.dart';

abstract class ILoginRepository implements Disposable {
  Future buscarUsuario(String email);
  Future buscarUsuarioSemFiltro(String email);
}
