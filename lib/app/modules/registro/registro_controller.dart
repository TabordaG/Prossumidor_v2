import 'dart:math';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/dados_basicos.dart';
import 'package:prossumidor_v2/app/models/usuario/usuario_model.dart';
import 'package:prossumidor_v2/app/modules/registro/repositories/interfaces/registro_repository_interface.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';
import 'package:search_cep/search_cep.dart';

part 'registro_controller.g.dart';

@Injectable()
class RegistroController = _RegistroControllerBase with _$RegistroController;

abstract class _RegistroControllerBase with Store {
  final IRegistroRepository registrarRepository =
      Modular.get<IRegistroRepository>();
  final AuthController authController = Modular.get<AuthController>();

  _RegistroControllerBase() {
    buscarLocaisRetirada();
  }

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
  TextEditingController nome = TextEditingController(text: "");

  @observable
  TextEditingController cpf = TextEditingController(text: "");

  @observable
  TextEditingController telefone = TextEditingController(text: "");

  @observable
  TextEditingController endereco = TextEditingController(text: "");

  // @action
  // setEndereco(String valor) => endereco = valor;

  @observable
  TextEditingController numero = TextEditingController(text: "");

  @observable
  TextEditingController complemento = TextEditingController(text: "");

  @observable
  TextEditingController bairro = TextEditingController(text: "");

  @observable
  TextEditingController cidade = TextEditingController(text: "");

  @observable
  TextEditingController uf = TextEditingController(text: "");

  @observable
  TextEditingController cep = TextEditingController(text: "");

  @observable
  TextEditingController email = TextEditingController(text: "");

  @observable
  String retirada = 'Local de Retirada';

  @observable
  bool isRetirada = true;

  @action
  setRetirada(String valor) => retirada = valor;

  @observable
  int retiradaID = -1;

  @action
  setRetiradaID(String valor) {
    
    int index =
        locaisRetirada.indexWhere((element) => element["nome"] == valor);
    retiradaID = index;
    
  }

  @observable
  List locaisRetirada = [];

  @observable
  List locaisRetiradaNomes = [];
  @observable
  TextEditingController senha = TextEditingController(text: "");

  @observable
  String codigoGerado = "";

  @observable
  String code = '';

  @action
  setCode(String valor) => code = valor;

  @observable
  bool page1Valid = false;

  @observable
  bool clickedButton = false;

  @observable
  bool generoValid = true;

  @action
  isGeneroValid() {
    if (genero == -1) {
      generoValid = false;
      return false;
    } else {
      generoValid = true;
      return true;
    }
  }

  @action
  isPage1Valid() {
    isGeneroValid();
    if (formkeyPage1.currentState.validate() && generoValid) {
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
    if (formkeyPage3.currentState.validate() && isRetiradaValid()) {
      page3Valid = true;
    } else {
      page3Valid = false;
    }
  }

  @action
  isRetiradaValid() {
    if (retirada != 'Local de Retirada') {
      isRetirada = true;
      return true;
    } else if (retirada == 'Local de Retirada') {
      isRetirada = false;
      return false;
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

  @action
  buscarLocaisRetirada() async {
    locaisRetirada =
        List.from(await registrarRepository.buscarLocaisRetirada());
    if (locaisRetirada != null)
      locaisRetirada.insert(
        0,
        {
          "nome": 'Local de Retirada',
          "descricao": "",
          "id": 0,
        },
      );

    locaisRetiradaNomes = [];
    locaisRetirada.forEach((element) {
      locaisRetiradaNomes.add(element["nome"]);
    });
    locaisRetiradaNomes = List.from(locaisRetiradaNomes);
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
  emailValido() async {
    var res = await registrarRepository.verificaEmail(email.text);
    print(res);
    if (res != null && res == 'livre') return true;
    return false;
  }

  @action
  enviarEmail() async {
    await gerarCodigo();
    var res = await registrarRepository.enviarEmail(email.text, codigoGerado);
    print(res);
  }

  @action
  setClickedButton(bool valor) => clickedButton = valor;

  @action
  registrar() async {
    String generoText = "";
    if (genero == 0) generoText = "MASCULINO";
    if (genero == 1)
      generoText = "FEMININO";
    else
      generoText = "OUTRO";

    var res = await registrarRepository.registrar(
      nome.text,
      cpf.text,
      telefone.text,
      generoText,
      email.text,
      Basicos.codificapwss(senha.text),
      retiradaID.toString(),
      removeCaracterEspecial(endereco.text),
      removeCaracterEspecial(bairro.text),
      removeCaracterEspecial(cidade.text),
      cep.text,
      removeCaracterEspecial(uf.text),
      numero.text,
      removeCaracterEspecial(complemento.text),
    );
    if (res != null) {
      var usuario = await registrarRepository.getData(email.text);
      if (usuario != null) {
        Basicos.localRetiradaID = usuario['local_retirada_id'].toString();
        authController.usuario = Usuario(
          id: usuario['id'],
          email: email.text,
          senha: usuario['senha'],
          empresa_id: usuario['empresa_id'],
        );
        print(usuario);
      }
    }

    if (authController.usuario == null)
      return null;
    else
      return "registrado";
  }

  @observable
  String responseCEP = "";

  @action
  buscaCEP() async {
    responseCEP = "waiting";
    final viaCepSearchCep = ViaCepSearchCep();
    final infoCepJSON = await viaCepSearchCep.searchInfoByCep(
        cep: cep.text.replaceAll(".", '').replaceAll("-", ""));
    if (infoCepJSON.isRight()) {
      print(infoCepJSON);
      Right(infoCepJSON).value.map((r) => {
            endereco.text = r.logradouro,
            complemento.text = r.complemento,
            bairro.text = r.bairro,
            cidade.text = r.localidade,
            uf.text = r.uf
          });
      responseCEP = "sucess";
    } else
      responseCEP = "Erro";
  }

  String removeCaracterEspecial(String texto) {
    // remove aspas, virgula e *
    String nova1 = texto.replaceAll(",", " ");
    String nova2 = nova1.replaceAll("\"", " ");
    String nova3 = nova2.replaceAll("*", " ");
    String novaf = nova3.replaceAll("'", " ");
    return novaf;
  }
}
