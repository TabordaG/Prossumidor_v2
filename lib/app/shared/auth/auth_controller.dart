import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/models/usuario/usuario_model.dart';
import 'package:prossumidor_v2/app/shared/auth/repositories/interfaces/auth_repository_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_controller.g.dart';

@Injectable()
class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository authRepository = Modular.get<IAuthRepository>();

  @observable
  Usuario usuario;

  @observable
  List localRetirada;

  @observable
  String localRetiradaAtual;

  @observable
  String versaoAtual;

  @action
  verificaLogado() async {
    versaoAtual = await authRepository.buscarVersao();

    if (versaoAtual == '1.0.2') {
      final email = await getValuesSF();
      if (email != '') {
        usuario = await authRepository.buscarUsuario(email);
        return 0;
      } else {
        usuario = null;
        return 1;
      }
    } else {
      versaoAtual =
          'Versão desatualizada, é necessário a nova versão para prosseguir. Entre na sua loja de aplicativos e clique em atualizar Recoopsol';
      return 2;
    }
  }

  @action
  cleanUser() => usuario = null;

  getValuesSF() async {
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    String stringValue = prefs1.getString('email') ?? '';

    return stringValue;
  }

  addStringToSF(String s) async {
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    prefs1.setString('email', s);
  }

  removeValues() async {
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    prefs1.remove('email');
  }
}
