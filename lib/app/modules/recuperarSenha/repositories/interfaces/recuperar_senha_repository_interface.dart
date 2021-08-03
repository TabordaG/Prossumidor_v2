import 'package:flutter_modular/flutter_modular.dart';

abstract class IRecuperarSenhaRepository implements Disposable {
  Future verifaEmail(String email);
  Future enviaEmail(String email, String mensagem);
}
