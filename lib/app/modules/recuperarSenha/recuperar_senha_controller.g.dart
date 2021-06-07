// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recuperar_senha_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $RecuperarSenhaController = BindInject(
  (i) => RecuperarSenhaController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecuperarSenhaController on _RecuperarSenhaControllerBase, Store {
  final _$valueAtom = Atom(name: '_RecuperarSenhaControllerBase.value');

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

  final _$_RecuperarSenhaControllerBaseActionController =
      ActionController(name: '_RecuperarSenhaControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_RecuperarSenhaControllerBaseActionController
        .startAction(name: '_RecuperarSenhaControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_RecuperarSenhaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
