import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';

part 'meus_dados_controller.g.dart';

@Injectable()
class MeusDadosController = _MeusDadosControllerBase with _$MeusDadosController;

abstract class _MeusDadosControllerBase with Store {
  _MeusDadosControllerBase() {
    nome = TextEditingController(text: authController.usuario.nome);
    cpf = TextEditingController(text: authController.usuario.cpf);
    telefone = TextEditingController(text: authController.usuario.telefone);
    genero = TextEditingController(text: authController.usuario.sexo);
    //generoOutro = TextEditingController(text: authController.usuario.sexo);
    //nome = TextEditingController(text: authController.usuario.);
    estadoCivil =
        TextEditingController(text: authController.usuario.estado_civil);
    localRetirada = TextEditingController(
        text: authController.usuario.empresa_id.toString());
  }
  final AuthController authController = Modular.get<AuthController>();

  @observable
  GlobalKey<FormState> formkeyPage = new GlobalKey<FormState>();

  @observable
  TextEditingController nome = TextEditingController();

  @observable
  TextEditingController cpf = TextEditingController();

  @observable
  TextEditingController telefone = TextEditingController();

  @observable
  TextEditingController genero = TextEditingController();

  @observable
  TextEditingController generoOutro = TextEditingController();

  @observable
  TextEditingController dataNascimento = TextEditingController();

  @observable
  TextEditingController estadoCivil = TextEditingController();

  @observable
  TextEditingController localRetirada = TextEditingController();

  @observable
  bool pageValid = false;

  @action
  isPageValid() {
    if (formkeyPage.currentState.validate())
      pageValid = true;
    else
      pageValid = false;
  }

  @action
  atualizaDados() {
    authController.usuario.nome = nome.text;
    authController.usuario.cpf = cpf.text;
    authController.usuario.telefone = telefone.text;
    authController.usuario.estado_civil = estadoCivil.text;
    authController.usuario.empresa_id = int.parse(localRetirada.text);
  }
}
