// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AuthController = BindInject(
  (i) => AuthController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  final _$usuarioAtom = Atom(name: '_AuthControllerBase.usuario');

  @override
  Usuario get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(Usuario value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  final _$versaoAtualAtom = Atom(name: '_AuthControllerBase.versaoAtual');

  @override
  String get versaoAtual {
    _$versaoAtualAtom.reportRead();
    return super.versaoAtual;
  }

  @override
  set versaoAtual(String value) {
    _$versaoAtualAtom.reportWrite(value, super.versaoAtual, () {
      super.versaoAtual = value;
    });
  }

  final _$verificaLogadoAsyncAction =
      AsyncAction('_AuthControllerBase.verificaLogado');

  @override
  Future verificaLogado() {
    return _$verificaLogadoAsyncAction.run(() => super.verificaLogado());
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
versaoAtual: ${versaoAtual}
    ''';
  }
}
