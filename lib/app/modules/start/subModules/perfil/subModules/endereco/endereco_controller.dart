import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/models/usuario/usuario_model.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';

part 'endereco_controller.g.dart';

@Injectable()
class EnderecoController = _EnderecoControllerBase with _$EnderecoController;

abstract class _EnderecoControllerBase with Store {
  _EnderecoControllerBase() {
    endereco = TextEditingController(text: authController.usuario.endereco);
    numero = TextEditingController(text: authController.usuario.numero);
    complemento =
        TextEditingController(text: authController.usuario.complemento);
    bairro = TextEditingController(text: authController.usuario.bairro);
    cidade = TextEditingController(text: authController.usuario.cidade);
    uf = TextEditingController(text: authController.usuario.estado);
    cep = TextEditingController(text: authController.usuario.cep);
  }
  final AuthController authController = Modular.get<AuthController>();

  @observable
  GlobalKey<FormState> formkeyPage = new GlobalKey<FormState>();

  @observable
  TextEditingController endereco = TextEditingController();

  @observable
  TextEditingController numero = TextEditingController();

  @observable
  TextEditingController complemento = TextEditingController();

  @observable
  TextEditingController bairro = TextEditingController();

  @observable
  TextEditingController cidade = TextEditingController();

  @observable
  TextEditingController uf = TextEditingController();

  @observable
  TextEditingController cep = TextEditingController();

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
    authController.usuario.endereco = endereco.text;
    authController.usuario.numero = numero.text;
    authController.usuario.complemento = complemento.text;
    authController.usuario.bairro = bairro.text;
    authController.usuario.cidade = cidade.text;
    authController.usuario.estado = uf.text;
    authController.usuario.cep = cep.text;
  }
}
