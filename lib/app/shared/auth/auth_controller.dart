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
  Usuario? usuario;

  @observable
  String? nomeCompleto;

  @observable
  String? centroDistribuicao;

  @observable
  List? localRetirada;

  @observable
  String? localRetiradaAtual;

  @observable
  String? versaoAtual;

  @observable
  String? mensagemVersao;

  @observable
  bool temMensagem = false;

  @action
  verificaLogado() async {
    versaoAtual = await authRepository.buscarVersao();

    final email = await getValuesSF();
    if (versaoAtual != '1.0.2') {
      if (versaoAtual == "2.0.1") {
        if (email != '') {
          usuario = await authRepository.buscarUsuario(email);
          await buscaMensagem();
          return 2;
        } else {
          usuario = null;
          return 3;
        }
      } else {
        mensagemVersao =
            'Nova versão disponivel, recomendamos que você atualize seu aplicativo para ter um melhor proveito do mesmo. Entre na sua loja de aplicativos e clique em atualizar Recoopsol';
        if (email != '') {
          usuario = await authRepository.buscarUsuario(email);
          await buscaMensagem();
          return 0;
        } else {
          usuario = null;
          return 1;
        }
      }
    } else {
      if (email != '') {
        usuario = await authRepository.buscarUsuario(email);
        await buscaMensagem();
        return 2;
      } else {
        usuario = null;
        return 3;
      }
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
    String? local;
    if (localRetirada != null) {
      for (var element in localRetirada!) {
        if (element['id'].toString() == usuario!.local_retirada_id.toString()) {
          local = element["nome"].toString();
        } else if (local == null || local.isEmpty) {
          local = 'Não encontrado';
        }
      }
    }
    return local ?? "";
  }

  @action
  Future<String> setNome() async {
    String name;
    if (usuario != null) {
      name = usuario!.nome_razao_social![0].toUpperCase() +
          usuario!.nome_razao_social!.substring(1) +
          usuario!.sobre_nome!;
    } else {
      name = 'nome';
    }
    return name;
  }

  @action
  Future buscaUsuarioCompleto() async {
    usuario = await authRepository.buscaUsuarioCompleto(usuario?.id);
    localRetirada =
        await authRepository.localRetirada(usuario?.email!.toLowerCase());
    if (localRetirada != null) {
      localRetirada = List.from(localRetirada!);
    }

    centroDistribuicao = await setCentroDistribuicao();
    nomeCompleto = await setNome();
  }

  @action
  Future buscaMensagem() async {
    var res = await authRepository.buscaMensagens(usuario!.id);
    if (res != null && res != 0) {
      temMensagem = true;
    } else {
      temMensagem = false;
    }
  }
}
