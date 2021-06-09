// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registro_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $RegistroController = BindInject(
  (i) => RegistroController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegistroController on _RegistroControllerBase, Store {
  final _$formkeyPage1Atom = Atom(name: '_RegistroControllerBase.formkeyPage1');

  @override
  GlobalKey<FormState> get formkeyPage1 {
    _$formkeyPage1Atom.reportRead();
    return super.formkeyPage1;
  }

  @override
  set formkeyPage1(GlobalKey<FormState> value) {
    _$formkeyPage1Atom.reportWrite(value, super.formkeyPage1, () {
      super.formkeyPage1 = value;
    });
  }

  final _$formkeyPage2Atom = Atom(name: '_RegistroControllerBase.formkeyPage2');

  @override
  GlobalKey<FormState> get formkeyPage2 {
    _$formkeyPage2Atom.reportRead();
    return super.formkeyPage2;
  }

  @override
  set formkeyPage2(GlobalKey<FormState> value) {
    _$formkeyPage2Atom.reportWrite(value, super.formkeyPage2, () {
      super.formkeyPage2 = value;
    });
  }

  final _$formkeyPage3Atom = Atom(name: '_RegistroControllerBase.formkeyPage3');

  @override
  GlobalKey<FormState> get formkeyPage3 {
    _$formkeyPage3Atom.reportRead();
    return super.formkeyPage3;
  }

  @override
  set formkeyPage3(GlobalKey<FormState> value) {
    _$formkeyPage3Atom.reportWrite(value, super.formkeyPage3, () {
      super.formkeyPage3 = value;
    });
  }

  final _$buttonCarouselControllerAtom =
      Atom(name: '_RegistroControllerBase.buttonCarouselController');

  @override
  CarouselController get buttonCarouselController {
    _$buttonCarouselControllerAtom.reportRead();
    return super.buttonCarouselController;
  }

  @override
  set buttonCarouselController(CarouselController value) {
    _$buttonCarouselControllerAtom
        .reportWrite(value, super.buttonCarouselController, () {
      super.buttonCarouselController = value;
    });
  }

  final _$currentAtom = Atom(name: '_RegistroControllerBase.current');

  @override
  int get current {
    _$currentAtom.reportRead();
    return super.current;
  }

  @override
  set current(int value) {
    _$currentAtom.reportWrite(value, super.current, () {
      super.current = value;
    });
  }

  final _$generoAtom = Atom(name: '_RegistroControllerBase.genero');

  @override
  int get genero {
    _$generoAtom.reportRead();
    return super.genero;
  }

  @override
  set genero(int value) {
    _$generoAtom.reportWrite(value, super.genero, () {
      super.genero = value;
    });
  }

  final _$generoOutroAtom = Atom(name: '_RegistroControllerBase.generoOutro');

  @override
  String get generoOutro {
    _$generoOutroAtom.reportRead();
    return super.generoOutro;
  }

  @override
  set generoOutro(String value) {
    _$generoOutroAtom.reportWrite(value, super.generoOutro, () {
      super.generoOutro = value;
    });
  }

  final _$nomeAtom = Atom(name: '_RegistroControllerBase.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$cpfAtom = Atom(name: '_RegistroControllerBase.cpf');

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  final _$telefoneAtom = Atom(name: '_RegistroControllerBase.telefone');

  @override
  String get telefone {
    _$telefoneAtom.reportRead();
    return super.telefone;
  }

  @override
  set telefone(String value) {
    _$telefoneAtom.reportWrite(value, super.telefone, () {
      super.telefone = value;
    });
  }

  final _$page1ValidAtom = Atom(name: '_RegistroControllerBase.page1Valid');

  @override
  bool get page1Valid {
    _$page1ValidAtom.reportRead();
    return super.page1Valid;
  }

  @override
  set page1Valid(bool value) {
    _$page1ValidAtom.reportWrite(value, super.page1Valid, () {
      super.page1Valid = value;
    });
  }

  final _$page2ValidAtom = Atom(name: '_RegistroControllerBase.page2Valid');

  @override
  bool get page2Valid {
    _$page2ValidAtom.reportRead();
    return super.page2Valid;
  }

  @override
  set page2Valid(bool value) {
    _$page2ValidAtom.reportWrite(value, super.page2Valid, () {
      super.page2Valid = value;
    });
  }

  final _$page3ValidAtom = Atom(name: '_RegistroControllerBase.page3Valid');

  @override
  bool get page3Valid {
    _$page3ValidAtom.reportRead();
    return super.page3Valid;
  }

  @override
  set page3Valid(bool value) {
    _$page3ValidAtom.reportWrite(value, super.page3Valid, () {
      super.page3Valid = value;
    });
  }

  final _$_RegistroControllerBaseActionController =
      ActionController(name: '_RegistroControllerBase');

  @override
  dynamic setGenero(int valor) {
    final _$actionInfo = _$_RegistroControllerBaseActionController.startAction(
        name: '_RegistroControllerBase.setGenero');
    try {
      return super.setGenero(valor);
    } finally {
      _$_RegistroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setGeneroOutro(String valor) {
    final _$actionInfo = _$_RegistroControllerBaseActionController.startAction(
        name: '_RegistroControllerBase.setGeneroOutro');
    try {
      return super.setGeneroOutro(valor);
    } finally {
      _$_RegistroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNome(String valor) {
    final _$actionInfo = _$_RegistroControllerBaseActionController.startAction(
        name: '_RegistroControllerBase.setNome');
    try {
      return super.setNome(valor);
    } finally {
      _$_RegistroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCPF(String valor) {
    final _$actionInfo = _$_RegistroControllerBaseActionController.startAction(
        name: '_RegistroControllerBase.setCPF');
    try {
      return super.setCPF(valor);
    } finally {
      _$_RegistroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTelefone(String valor) {
    final _$actionInfo = _$_RegistroControllerBaseActionController.startAction(
        name: '_RegistroControllerBase.setTelefone');
    try {
      return super.setTelefone(valor);
    } finally {
      _$_RegistroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic isPage1Valid() {
    final _$actionInfo = _$_RegistroControllerBaseActionController.startAction(
        name: '_RegistroControllerBase.isPage1Valid');
    try {
      return super.isPage1Valid();
    } finally {
      _$_RegistroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic isPage2Valid() {
    final _$actionInfo = _$_RegistroControllerBaseActionController.startAction(
        name: '_RegistroControllerBase.isPage2Valid');
    try {
      return super.isPage2Valid();
    } finally {
      _$_RegistroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic isPage3Valid() {
    final _$actionInfo = _$_RegistroControllerBaseActionController.startAction(
        name: '_RegistroControllerBase.isPage3Valid');
    try {
      return super.isPage3Valid();
    } finally {
      _$_RegistroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIndex(int valor) {
    final _$actionInfo = _$_RegistroControllerBaseActionController.startAction(
        name: '_RegistroControllerBase.setIndex');
    try {
      return super.setIndex(valor);
    } finally {
      _$_RegistroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNextPage() {
    final _$actionInfo = _$_RegistroControllerBaseActionController.startAction(
        name: '_RegistroControllerBase.setNextPage');
    try {
      return super.setNextPage();
    } finally {
      _$_RegistroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPreviousPage() {
    final _$actionInfo = _$_RegistroControllerBaseActionController.startAction(
        name: '_RegistroControllerBase.setPreviousPage');
    try {
      return super.setPreviousPage();
    } finally {
      _$_RegistroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formkeyPage1: ${formkeyPage1},
formkeyPage2: ${formkeyPage2},
formkeyPage3: ${formkeyPage3},
buttonCarouselController: ${buttonCarouselController},
current: ${current},
genero: ${genero},
generoOutro: ${generoOutro},
nome: ${nome},
cpf: ${cpf},
telefone: ${telefone},
page1Valid: ${page1Valid},
page2Valid: ${page2Valid},
page3Valid: ${page3Valid}
    ''';
  }
}
