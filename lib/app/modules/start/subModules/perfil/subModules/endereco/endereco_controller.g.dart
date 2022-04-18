// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endereco_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $EnderecoController = BindInject(
  (i) => EnderecoController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EnderecoController on _EnderecoControllerBase, Store {
  final _$formkeyPageAtom = Atom(name: '_EnderecoControllerBase.formkeyPage');

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

  final _$enderecoAtom = Atom(name: '_EnderecoControllerBase.endereco');

  @override
  TextEditingController get endereco {
    _$enderecoAtom.reportRead();
    return super.endereco;
  }

  @override
  set endereco(TextEditingController value) {
    _$enderecoAtom.reportWrite(value, super.endereco, () {
      super.endereco = value;
    });
  }

  final _$numeroAtom = Atom(name: '_EnderecoControllerBase.numero');

  @override
  TextEditingController get numero {
    _$numeroAtom.reportRead();
    return super.numero;
  }

  @override
  set numero(TextEditingController value) {
    _$numeroAtom.reportWrite(value, super.numero, () {
      super.numero = value;
    });
  }

  final _$complementoAtom = Atom(name: '_EnderecoControllerBase.complemento');

  @override
  TextEditingController get complemento {
    _$complementoAtom.reportRead();
    return super.complemento;
  }

  @override
  set complemento(TextEditingController value) {
    _$complementoAtom.reportWrite(value, super.complemento, () {
      super.complemento = value;
    });
  }

  final _$bairroAtom = Atom(name: '_EnderecoControllerBase.bairro');

  @override
  TextEditingController get bairro {
    _$bairroAtom.reportRead();
    return super.bairro;
  }

  @override
  set bairro(TextEditingController value) {
    _$bairroAtom.reportWrite(value, super.bairro, () {
      super.bairro = value;
    });
  }

  final _$cidadeAtom = Atom(name: '_EnderecoControllerBase.cidade');

  @override
  TextEditingController get cidade {
    _$cidadeAtom.reportRead();
    return super.cidade;
  }

  @override
  set cidade(TextEditingController value) {
    _$cidadeAtom.reportWrite(value, super.cidade, () {
      super.cidade = value;
    });
  }

  final _$ufAtom = Atom(name: '_EnderecoControllerBase.uf');

  @override
  TextEditingController get uf {
    _$ufAtom.reportRead();
    return super.uf;
  }

  @override
  set uf(TextEditingController value) {
    _$ufAtom.reportWrite(value, super.uf, () {
      super.uf = value;
    });
  }

  final _$cepAtom = Atom(name: '_EnderecoControllerBase.cep');

  @override
  TextEditingController get cep {
    _$cepAtom.reportRead();
    return super.cep;
  }

  @override
  set cep(TextEditingController value) {
    _$cepAtom.reportWrite(value, super.cep, () {
      super.cep = value;
    });
  }

  final _$pageValidAtom = Atom(name: '_EnderecoControllerBase.pageValid');

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

  final _$dropdownvalueAtom =
      Atom(name: '_EnderecoControllerBase.dropdownvalue');

  @override
  String get dropdownvalue {
    _$dropdownvalueAtom.reportRead();
    return super.dropdownvalue;
  }

  @override
  set dropdownvalue(String value) {
    _$dropdownvalueAtom.reportWrite(value, super.dropdownvalue, () {
      super.dropdownvalue = value;
    });
  }

  final _$listLocalRetiradaAtom =
      Atom(name: '_EnderecoControllerBase.listLocalRetirada');

  @override
  List<String> get listLocalRetirada {
    _$listLocalRetiradaAtom.reportRead();
    return super.listLocalRetirada;
  }

  @override
  set listLocalRetirada(List<String> value) {
    _$listLocalRetiradaAtom.reportWrite(value, super.listLocalRetirada, () {
      super.listLocalRetirada = value;
    });
  }

  final _$idRetiradaAtom = Atom(name: '_EnderecoControllerBase.idRetirada');

  @override
  String get idRetirada {
    _$idRetiradaAtom.reportRead();
    return super.idRetirada;
  }

  @override
  set idRetirada(String value) {
    _$idRetiradaAtom.reportWrite(value, super.idRetirada, () {
      super.idRetirada = value;
    });
  }

  final _$buscaUserAsyncAction =
      AsyncAction('_EnderecoControllerBase.buscaUser');

  @override
  Future buscaUser() {
    return _$buscaUserAsyncAction.run(() => super.buscaUser());
  }

  final _$atualizaDadosAsyncAction =
      AsyncAction('_EnderecoControllerBase.atualizaDados');

  @override
  Future<dynamic> atualizaDados() {
    return _$atualizaDadosAsyncAction.run(() => super.atualizaDados());
  }

  final _$_EnderecoControllerBaseActionController =
      ActionController(name: '_EnderecoControllerBase');

  @override
  dynamic mudaDropDown(String value) {
    final _$actionInfo = _$_EnderecoControllerBaseActionController.startAction(
        name: '_EnderecoControllerBase.mudaDropDown');
    try {
      return super.mudaDropDown(value);
    } finally {
      _$_EnderecoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic isPageValid() {
    final _$actionInfo = _$_EnderecoControllerBaseActionController.startAction(
        name: '_EnderecoControllerBase.isPageValid');
    try {
      return super.isPageValid();
    } finally {
      _$_EnderecoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getLocalRetirada() {
    final _$actionInfo = _$_EnderecoControllerBaseActionController.startAction(
        name: '_EnderecoControllerBase.getLocalRetirada');
    try {
      return super.getLocalRetirada();
    } finally {
      _$_EnderecoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formkeyPage: ${formkeyPage},
endereco: ${endereco},
numero: ${numero},
complemento: ${complemento},
bairro: ${bairro},
cidade: ${cidade},
uf: ${uf},
cep: ${cep},
pageValid: ${pageValid},
dropdownvalue: ${dropdownvalue},
listLocalRetirada: ${listLocalRetirada},
idRetirada: ${idRetirada}
    ''';
  }
}
