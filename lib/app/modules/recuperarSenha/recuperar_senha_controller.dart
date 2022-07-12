import 'dart:math';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/modules/recuperarSenha/repositories/interfaces/recuperar_senha_repository_interface.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

part 'recuperar_senha_controller.g.dart';

@Injectable()
class RecuperarSenhaController = _RecuperarSenhaControllerBase
    with _$RecuperarSenhaController;

abstract class _RecuperarSenhaControllerBase with Store {
  final IRecuperarSenhaRepository recuperarRepository =
      Modular.get<IRecuperarSenhaRepository>();

  @observable
  GlobalKey<FormState> formkeyPage1 = GlobalKey<FormState>();

  @observable
  GlobalKey<FormState> formkeyPage2 = GlobalKey<FormState>();

  @observable
  GlobalKey<FormState> formkeyPage3 = GlobalKey<FormState>();

  @observable
  CarouselController buttonCarouselController = CarouselController();

  @observable
  TextEditingController code = TextEditingController(text: "");

  @observable
  String codigoGerado = "";

  @observable
  TextEditingController email = TextEditingController(text: "");

  @observable
  TextEditingController senha = TextEditingController(text: "");

  @observable
  TextEditingController confirmarSenha = TextEditingController(text: "");

  @observable
  bool emailValido = false;

  @observable
  bool codigoValido = false;

  @observable
  bool senhaAlterada = false;

  @observable
  bool confirmaReenvio = false;

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
    if (formkeyPage1.currentState!.validate()) {
      page1Valid = true;
    } else {
      page1Valid = false;
    }
  }

  @observable
  bool page2Valid = false;

  @action
  isPage2Valid() {
    if (formkeyPage2.currentState!.validate()) {
      page2Valid = true;
    } else {
      page2Valid = false;
    }
  }

  @observable
  bool page3Valid = false;

  @action
  isPage3Valid() {
    if (formkeyPage3.currentState!.validate()) {
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
  Future setNextPage(ProgressDialog progressDialog) async {
    switch (current) {
      case 0:
        emailValido = false;
        isPage1Valid();
        if (page1Valid) {
          progressDialog.show(
            msg: "Carregando...",
            backgroundColor: Colors.white,
            borderRadius: 5.0,
            progressType: ProgressType.normal,
            max: 3,
          );
          bool response = await verificarEmail();
          Future.delayed(const Duration(seconds: 2), () {
            progressDialog.close();
            if (response) {
              buttonCarouselController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
              );
              enviarRecuperacao();
            }
          });
        }
        break;
      case 1:
        codigoValido = false;
        // Verifica se os campos estão preenchidos
        isPage2Valid();
        if (page2Valid) {
          progressDialog.show(
            msg: "Carregando...",
            backgroundColor: Colors.white,
            borderRadius: 5.0,
            progressType: ProgressType.normal,
            max: 3,
          );
          Future.delayed(const Duration(seconds: 2), () {
            progressDialog.close();
            // Se os códigos batem
            if (verificaCodigo()) {
              buttonCarouselController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
              );
            }
          });
        }
        break;
      default:
    }
  }

  @action
  setPreviousPage() => buttonCarouselController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );

  @action
  Future<bool> verificarEmail() async {
    var response = await recuperarRepository.verifaEmail(email.text);
    if (response != null && response != "livre") {
      emailValido = true;
      return true;
    } else {
      emailValido = false;
      return false;
    }
  }

  @action
  enviarRecuperacao() async {
    var res = await recuperarRepository.enviaEmail(email.text, gerarCodigo());
    if (res != null) {}
  }

  @action
  reenviarRecuperacao() async {
    var res = await recuperarRepository.enviaEmail(email.text, codigoGerado);
    if (res != null) {
      setConfirmaReenvio(true);
    }
  }

  @action
  setConfirmaReenvio(bool value) {
    confirmaReenvio = value;
  }

  @action
  gerarCodigo() {
    var rng = Random();
    codigoGerado = "";
    for (var i = 0; i < 4; i++) {
      codigoGerado += rng.nextInt(9).toString();
    }
    return codigoGerado;
  }

  @action
  verificaCodigo() {
    if (codigoGerado == code.text) {
      codigoValido = true;
      return true;
    }
    codigoValido = false;
    return false;
  }

  @action
  alterarNovaSenha() async {
    var res = await recuperarRepository.alterarSenha(email.text, senha.text);
    if (res != null) {}
    return res;
  }
}
