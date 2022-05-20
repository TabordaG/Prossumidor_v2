import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/app_controller.dart';
import 'package:prossumidor_v2/app/models/usuario/usuario_model.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';

import '../../dados_basicos.dart';
import 'repositories/interfaces/login_repository_interface.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final ILoginRepository loginRepository = Modular.get<ILoginRepository>();
  final AuthController authController = Modular.get<AuthController>();
  final AppController appController = Modular.get<AppController>();

  @observable
  String email = '';

  @observable
  String senha = '';

  @observable
  bool obscureSenha = true;

  @action
  setEmail(String valor) => email = valor;

  @action
  setSenha(String valor) => senha = valor;

  @action
  setObscureSenha(bool valor) => obscureSenha = valor;

  @action
  verificaLogin() async {
    Usuario usuario = await loginRepository.buscarUsuario(email);
    if (usuario != null) {
      if (usuario.senha != null &&
          Basicos.decodificapwss(usuario.senha.toString()) == senha) {
        authController.usuario = usuario;
        appController.setIndexBottomNavigator(2);
        return 0;
      } else {
        authController.usuario = null;
        return 1;
      }
    } else {
      Usuario usuarioInativo =
          await loginRepository.buscarUsuarioSemFiltro(email);
      if (usuarioInativo == null) {
        return 2;
      } else {
        return 3;
      }
    }
  }
}
