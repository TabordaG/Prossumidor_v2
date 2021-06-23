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
  String toString() {
    return '''
entrega: ${entrega}
    ''';
  }
}
