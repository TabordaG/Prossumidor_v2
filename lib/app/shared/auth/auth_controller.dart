import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
  String nomeCompleto;

  @observable
  String centroDistribuicao;

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

  @action
  Future<String> setCentroDistribuicao() async {
    String local;
    localRetirada.forEach((element) {
      if (element['id'].toString() == usuario.local_retirada_id.toString()) {
        local = element["nome"].toString();
        print("Encontrado");
      } else if (local == null || local.isEmpty) local = 'Não encontrado';
    });
    return local;
  }

  @action
  Future<String> setNome() async {
    String name;
    if (usuario != null) {
      name = usuario.nome_razao_social[0].toUpperCase() +
          usuario.nome_razao_social.substring(1) +
          usuario.sobre_nome;
    } else
      name = 'nome';
    return name;
  }

  @action
  Future buscaUsuarioCompleto() async {
    usuario = await authRepository.buscaUsuarioCompleto(usuario.id);
    localRetirada =
        await authRepository.localRetirada(usuario.email.toLowerCase());
    localRetirada = List.from(localRetirada);

    centroDistribuicao = await setCentroDistribuicao();
    nomeCompleto = await setNome();
  }
}
