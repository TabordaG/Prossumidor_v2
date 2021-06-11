import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'registro_controller.g.dart';

@Injectable()
class RegistroController = _RegistroControllerBase with _$RegistroController;

abstract class _RegistroControllerBase with Store {
  @observable
  GlobalKey<FormState> formkeyPage1 = new GlobalKey<FormState>();

  @observable
  GlobalKey<FormState> formkeyPage2 = new GlobalKey<FormState>();

  @observable
  GlobalKey<FormState> formkeyPage3 = new GlobalKey<FormState>();

  @observable
  GlobalKey<FormState> formkeyPage4 = new GlobalKey<FormState>();

  @observable
  CarouselController buttonCarouselController = CarouselController();

  @observable
  int current = 0;

  @observable
  int genero = -1;

  @action
  setGenero(int valor) => genero = valor;

  @observable
  String generoOutro = '';

  @action
  setGeneroOutro(String valor) => generoOutro = valor;

  @observable
  String nome = '';

  @action
  setNome(String valor) => nome = valor;

  @observable
  String cpf = '';

  @action
  setCPF(String valor) => cpf = valor;

  @observable
  String telefone = '';

  @action
  setTelefone(String valor) => telefone = valor;

  @observable
  String endereco = '';

  @action
  setEndereco(String valor) => endereco = valor;

  @observable
  String numero = '';

  @action
  setNumero(String valor) => numero = valor;

  @observable
  String complemento = '';

  @action
  setComplemento(String valor) => complemento = valor;

  @observable
  String bairro = '';

  @action
  setBairro(String valor) => bairro = valor;

  @observable
  String cidade = '';

  @action
  setCidade(String valor) => cidade = valor;

  @observable
  String uf = '';

  @action
  setUF(String valor) => uf = valor;

  @observable
  String cep = '';

  @action
  setCEP(String valor) => cep = valor;

  @observable
  String email = '';

  @action
  setEmail(String valor) => email = valor;

  @observable
  String retirada = 'Local de Retirada';

  @action
  setRetirada(String valor) => retirada = valor;

  @observable
  String senha = '';

  @action
  setSenha(String valor) => senha = valor;

  @observable
  String code = '';

  @action
  setCode(String valor) => code = valor;

  @observable
  bool page1Valid = false;

  @action
  isPage1Valid() {
    if (formkeyPage1.currentState.validate() && genero != -1) {
      page1Valid = true;
    } else {
      page1Valid = false;
    }
  }

  @observable
  bool page2Valid = false;

  @action
  isPage2Valid() {
    if (formkeyPage2.currentState.validate()) {
      page2Valid = true;
    } else {
      page2Valid = false;
    }
  }

  @observable
  bool page3Valid = false;

  @action
  isPage3Valid() {
    if (formkeyPage3.currentState.validate()) {
      page3Valid = true;
    } else {
      page3Valid = false;
    }
  }

  @action
  setIndex(int valor) => current = valor;

  @action
  setNextPage() {
    switch (current) {
      case 0:
        isPage1Valid();
        if (page1Valid)
          buttonCarouselController.nextPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        break;
      case 1:
        isPage2Valid();
        if (page2Valid)
          buttonCarouselController.nextPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        break;
      default:
    }
  }

  @action
  setPreviousPage() => buttonCarouselController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
      );
}
