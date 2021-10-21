import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/home/home_controller.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';

part 'sacola_controller.g.dart';

@Injectable()
class SacolaController = _SacolaControllerBase with _$SacolaController;

abstract class _SacolaControllerBase with Store {
  final AuthController authController = Modular.get<AuthController>();
  final HomeController homeController = Modular.get<HomeController>();

  _SacolaControllerBase() {
    endereco = TextEditingController(text: authController.usuario.endereco);
    numero = TextEditingController(text: authController.usuario.numero);
    complemento =
        TextEditingController(text: authController.usuario.complemento);
    bairro = TextEditingController(text: authController.usuario.bairro);
    cidade = TextEditingController(text: authController.usuario.cidade);
    uf = TextEditingController(text: authController.usuario.estado);
    cep = TextEditingController(text: authController.usuario.cep);
    //dropdownvalue = authController.usuario.empresa;
  }

  @observable
  int total = 40;

  @observable
  int entrega = 0;

  @action
  setEntrega(int valor) {
    entrega = valor;
    if (valor == 1) {
      setFrete(0.0);
      total = 40;
    } else {
      setFrete(5.0);
      total = 45;
    }
  }

  @observable
  int pagamento = 0;

  @action
  setPagamento(int valor) => pagamento = valor;

  @observable
  double frete = 5.0;

  @action
  setFrete(double valor) => frete = valor;

  @observable
  int value = 1;

  @action
  void increment(int limite) {
    if (value < limite) value++;
  }

  @action
  void decrement() {
    if (value > 0) value--;
  }

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

  @observable
  String dropdownvalue;

  @action
  mudaDropDown(String value) => dropdownvalue = value;

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
    //authController.usuario.empresa = dropdownvalue;
    authController.centroDistribuicao = dropdownvalue;
  }
}
