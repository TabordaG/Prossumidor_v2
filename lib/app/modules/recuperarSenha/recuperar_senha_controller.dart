import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'recuperar_senha_controller.g.dart';

@Injectable()
class RecuperarSenhaController = _RecuperarSenhaControllerBase
    with _$RecuperarSenhaController;

abstract class _RecuperarSenhaControllerBase with Store {
  @observable
  GlobalKey<FormState> formkeyPage1 = GlobalKey<FormState>();

  @observable
  GlobalKey<FormState> formkeyPage2 = GlobalKey<FormState>();

  @observable
  GlobalKey<FormState> formkeyPage3 = GlobalKey<FormState>();

  @observable
  CarouselController buttonCarouselController = CarouselController();

  @observable
  String code = '';

  @action
  setCode(String valor) => code = valor;

  @observable
  String email = '';

  @action
  setEmail(String valor) => email = valor;

  @observable
  String senha = '';

  @action
  setSenha(String valor) => senha = valor;

  @observable
  bool obscureSenha1 = true;

  @action
  setObscureSenha1(bool valor) => obscureSenha1 = valor;

  @observable
  bool obscureSenha2 = true;

  @action
  setObscureSenha2(bool valor) => obscureSenha2 = valor;

  @observable
  bool page1Valid = false;

  @action
  isPage1Valid() {
    if (formkeyPage1.currentState.validate()) {
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

  @observable
  int current = 0;

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
