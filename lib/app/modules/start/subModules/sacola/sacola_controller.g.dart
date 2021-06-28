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
  String toString() {
    return '''
total: ${total},
entrega: ${entrega},
pagamento: ${pagamento},
frete: ${frete},
value: ${value}
    ''';
  }
}
