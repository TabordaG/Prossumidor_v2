// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sacola_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SacolaController = BindInject(
  (i) => SacolaController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SacolaController on _SacolaControllerBase, Store {
  final _$totalAtom = Atom(name: '_SacolaControllerBase.total');

  @override
  int get total {
    _$totalAtom.reportRead();
    return super.total;
  }

  @override
  set total(int value) {
    _$totalAtom.reportWrite(value, super.total, () {
      super.total = value;
    });
  }

  final _$entregaAtom = Atom(name: '_SacolaControllerBase.entrega');

  @override
  int get entrega {
    _$entregaAtom.reportRead();
    return super.entrega;
  }

  @override
  set entrega(int value) {
    _$entregaAtom.reportWrite(value, super.entrega, () {
      super.entrega = value;
    });
  }

  final _$pagamentoAtom = Atom(name: '_SacolaControllerBase.pagamento');

  @override
  int get pagamento {
    _$pagamentoAtom.reportRead();
    return super.pagamento;
  }

  @override
  set pagamento(int value) {
    _$pagamentoAtom.reportWrite(value, super.pagamento, () {
      super.pagamento = value;
    });
  }

  final _$freteAtom = Atom(name: '_SacolaControllerBase.frete');

  @override
  double get frete {
    _$freteAtom.reportRead();
    return super.frete;
  }

  @override
  set frete(double value) {
    _$freteAtom.reportWrite(value, super.frete, () {
      super.frete = value;
    });
  }

  final _$valueAtom = Atom(name: '_SacolaControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$formkeyPageAtom = Atom(name: '_SacolaControllerBase.formkeyPage');

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

  final _$enderecoAtom = Atom(name: '_SacolaControllerBase.endereco');

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

  final _$numeroAtom = Atom(name: '_SacolaControllerBase.numero');

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

  final _$complementoAtom = Atom(name: '_SacolaControllerBase.complemento');

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

  final _$bairroAtom = Atom(name: '_SacolaControllerBase.bairro');

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

  final _$cidadeAtom = Atom(name: '_SacolaControllerBase.cidade');

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

  final _$ufAtom = Atom(name: '_SacolaControllerBase.uf');

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

  final _$cepAtom = Atom(name: '_SacolaControllerBase.cep');

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

  final _$pageValidAtom = Atom(name: '_SacolaControllerBase.pageValid');

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

  final _$dropdownvalueAtom = Atom(name: '_SacolaControllerBase.dropdownvalue');

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

  final _$_SacolaControllerBaseActionController =
      ActionController(name: '_SacolaControllerBase');

  @override
  dynamic setEntrega(int valor) {
    final _$actionInfo = _$_SacolaControllerBaseActionController.startAction(
        name: '_SacolaControllerBase.setEntrega');
    try {
      return super.setEntrega(valor);
    } finally {
      _$_SacolaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPagamento(int valor) {
    final _$actionInfo = _$_SacolaControllerBaseActionController.startAction(
        name: '_SacolaControllerBase.setPagamento');
    try {
      return super.setPagamento(valor);
    } finally {
      _$_SacolaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFrete(double valor) {
    final _$actionInfo = _$_SacolaControllerBaseActionController.startAction(
        name: '_SacolaControllerBase.setFrete');
    try {
      return super.setFrete(valor);
    } finally {
      _$_SacolaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increment(int limite) {
    final _$actionInfo = _$_SacolaControllerBaseActionController.startAction(
        name: '_SacolaControllerBase.increment');
    try {
      return super.increment(limite);
    } finally {
      _$_SacolaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_SacolaControllerBaseActionController.startAction(
        name: '_SacolaControllerBase.decrement');
    try {
      return super.decrement();
    } finally {
      _$_SacolaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic mudaDropDown(String value) {
    final _$actionInfo = _$_SacolaControllerBaseActionController.startAction(
        name: '_SacolaControllerBase.mudaDropDown');
    try {
      return super.mudaDropDown(value);
    } finally {
      _$_SacolaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic isPageValid() {
    final _$actionInfo = _$_SacolaControllerBaseActionController.startAction(
        name: '_SacolaControllerBase.isPageValid');
    try {
      return super.isPageValid();
    } finally {
      _$_SacolaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic atualizaDados() {
    final _$actionInfo = _$_SacolaControllerBaseActionController.startAction(
        name: '_SacolaControllerBase.atualizaDados');
    try {
      return super.atualizaDados();
    } finally {
      _$_SacolaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
total: ${total},
entrega: ${entrega},
pagamento: ${pagamento},
frete: ${frete},
value: ${value},
formkeyPage: ${formkeyPage},
endereco: ${endereco},
numero: ${numero},
complemento: ${complemento},
bairro: ${bairro},
cidade: ${cidade},
uf: ${uf},
cep: ${cep},
pageValid: ${pageValid},
dropdownvalue: ${dropdownvalue}
    ''';
  }
}
