import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/repositories/interfaces/perfil_repository_interface.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';

part 'perfil_controller.g.dart';

@Injectable()
class PerfilController = _PerfilControllerBase with _$PerfilController;

abstract class _PerfilControllerBase with Store {
  _PerfilControllerBase() {
    buscaUsuario();
  }
  final AuthController authController = Modular.get<AuthController>();
  final IPerfilRepository perfilRepository = Modular.get<IPerfilRepository>();

  @observable
  String centroDistribuicao = '';

  @observable
  String nome = '';

  @observable
  ScrollController scrollController;

  @action
  Future<String> setCentroDistribuicao() async {
    String local;
    authController.localRetirada.forEach((element) {
      if (element['id'].toString() ==
          authController.usuario.local_retirada_id.toString()) {
        local = element["nome"].toString();
        print("Encontrado");
      } else if (local == null || local.isEmpty) local = 'Não encontrado';
    });
    return local;
  }

  @action
  Future<String> setNome() async {
    String name;
    if (authController.usuario != null) {
      name = authController.usuario.nome_razao_social[0].toUpperCase() +
          authController.usuario.nome_razao_social.substring(1) +
          authController.usuario.sobre_nome;
    } else
      name = 'nome';
    return name;
  }

  @action
  Future buscaUsuario() async {
    authController.usuario =
        await perfilRepository.buscaUsuario(authController.usuario.id);
    authController.localRetirada = await perfilRepository
        .localRetirada(authController.usuario.email.toLowerCase());
    authController.localRetirada = List.from(authController.localRetirada);

    centroDistribuicao = await setCentroDistribuicao();
    nome = await setNome();
  }
}
