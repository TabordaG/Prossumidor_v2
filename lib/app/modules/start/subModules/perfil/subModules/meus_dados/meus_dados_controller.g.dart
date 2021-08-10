// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meus_dados_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $MeusDadosController = BindInject(
  (i) => MeusDadosController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MeusDadosController on _MeusDadosControllerBase, Store {
  final _$formkeyPageAtom = Atom(name: '_MeusDadosControllerBase.formkeyPage');

  @override
  GlobalKey<FormState> get formkeyPage {
    _$formkeyPageAtom.reportRead();
    return super.formkeyPage;
  }

  @override
  set formkeyPage(GlobalKey<FormState> value) {
    _$formkeyPageAtom.reportWrite(value, super.formkeyPage, () {
      super.formkeyPage = value;
    });
  }

  final _$nomeAtom = Atom(name: '_MeusDadosControllerBase.nome');

  @override
  TextEditingController get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(TextEditingController value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$cpfAtom = Atom(name: '_MeusDadosControllerBase.cpf');

  @override
  TextEditingController get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(TextEditingController value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  final _$telefoneAtom = Atom(name: '_MeusDadosControllerBase.telefone');

  @override
  TextEditingController get telefone {
    _$telefoneAtom.reportRead();
    return super.telefone;
  }

  @override
  set telefone(TextEditingController value) {
    _$telefoneAtom.reportWrite(value, super.telefone, () {
      super.telefone = value;
    });
  }

  final _$generoAtom = Atom(name: '_MeusDadosControllerBase.genero');

  @override
  TextEditingController get genero {
    _$generoAtom.reportRead();
    return super.genero;
  }

  @override
  set genero(TextEditingController value) {
    _$generoAtom.reportWrite(value, super.genero, () {
      super.genero = value;
    });
  }

  final _$generoIdAtom = Atom(name: '_MeusDadosControllerBase.generoId');

  @override
  int get generoId {
    _$generoIdAtom.reportRead();
    return super.generoId;
  }

  @override
  set generoId(int value) {
    _$generoIdAtom.reportWrite(value, super.generoId, () {
      super.generoId = value;
    });
  }

  final _$generoOutroAtom = Atom(name: '_MeusDadosControllerBase.generoOutro');

  @override
  TextEditingController get generoOutro {
    _$generoOutroAtom.reportRead();
    return super.generoOutro;
  }

  @override
  set generoOutro(TextEditingController value) {
    _$generoOutroAtom.reportWrite(value, super.generoOutro, () {
      super.generoOutro = value;
    });
  }

  final _$dataNascimentoAtom =
      Atom(name: '_MeusDadosControllerBase.dataNascimento');

  @override
  TextEditingController get dataNascimento {
    _$dataNascimentoAtom.reportRead();
    return super.dataNascimento;
  }

  @override
  set dataNascimento(TextEditingController value) {
    _$dataNascimentoAtom.reportWrite(value, super.dataNascimento, () {
      super.dataNascimento = value;
    });
  }

  final _$estadoCivilAtom = Atom(name: '_MeusDadosControllerBase.estadoCivil');

  @override
  TextEditingController get estadoCivil {
    _$estadoCivilAtom.reportRead();
    return super.estadoCivil;
  }

  @override
  set estadoCivil(TextEditingController value) {
    _$estadoCivilAtom.reportWrite(value, super.estadoCivil, () {
      super.estadoCivil = value;
    });
  }

  final _$localRetiradaAtom =
      Atom(name: '_MeusDadosControllerBase.localRetirada');

  @override
  TextEditingController get localRetirada {
    _$localRetiradaAtom.reportRead();
    return super.localRetirada;
  }

  @override
  set localRetirada(TextEditingController value) {
    _$localRetiradaAtom.reportWrite(value, super.localRetirada, () {
      super.localRetirada = value;
    });
  }

  final _$pageValidAtom = Atom(name: '_MeusDadosControllerBase.pageValid');

  @override
  bool get pageValid {
    _$pageValidAtom.reportRead();
    return super.pageValid;
  }

  @override
  set pageValid(bool value) {
    _$pageValidAtom.reportWrite(value, super.pageValid, () {
      super.pageValid = value;
    });
  }

  final _$atualizaDadosAsyncAction =
      AsyncAction('_MeusDadosControllerBase.atualizaDados');

  @override
  Future atualizaDados() {
    return _$atualizaDadosAsyncAction.run(() => super.atualizaDados());
  }

  final _$_MeusDadosControllerBaseActionController =
      ActionController(name: '_MeusDadosControllerBase');

  @override
  dynamic isPageValid() {
    final _$actionInfo = _$_MeusDadosControllerBaseActionController.startAction(
        name: '_MeusDadosControllerBase.isPageValid');
    try {
      return super.isPageValid();
    } finally {
      _$_MeusDadosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic buscaUser() {
    final _$actionInfo = _$_MeusDadosControllerBaseActionController.startAction(
        name: '_MeusDadosControllerBase.buscaUser');
    try {
      return super.buscaUser();
    } finally {
      _$_MeusDadosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getLocalRetirada() {
    final _$actionInfo = _$_MeusDadosControllerBaseActionController.startAction(
        name: '_MeusDadosControllerBase.getLocalRetirada');
    try {
      return super.getLocalRetirada();
    } finally {
      _$_MeusDadosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formkeyPage: ${formkeyPage},
nome: ${nome},
cpf: ${cpf},
telefone: ${telefone},
genero: ${genero},
generoId: ${generoId},
generoOutro: ${generoOutro},
dataNascimento: ${dataNascimento},
estadoCivil: ${estadoCivil},
localRetirada: ${localRetirada},
pageValid: ${pageValid}
    ''';
  }
}
