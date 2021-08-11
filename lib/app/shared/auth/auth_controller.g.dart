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

  final _$localRetiradaAtom = Atom(name: '_AuthControllerBase.localRetirada');

  @override
  List<dynamic> get localRetirada {
    _$localRetiradaAtom.reportRead();
    return super.localRetirada;
  }

  @override
  set localRetirada(List<dynamic> value) {
    _$localRetiradaAtom.reportWrite(value, super.localRetirada, () {
      super.localRetirada = value;
    });
  }

  final _$localRetiradaAtualAtom =
      Atom(name: '_AuthControllerBase.localRetiradaAtual');

  @override
  String get localRetiradaAtual {
    _$localRetiradaAtualAtom.reportRead();
    return super.localRetiradaAtual;
  }

  @override
  set localRetiradaAtual(String value) {
    _$localRetiradaAtualAtom.reportWrite(value, super.localRetiradaAtual, () {
      super.localRetiradaAtual = value;
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

  final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase');

  @override
  dynamic cleanUser() {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.cleanUser');
    try {
      return super.cleanUser();
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
localRetirada: ${localRetirada},
localRetiradaAtual: ${localRetiradaAtual},
versaoAtual: ${versaoAtual}
    ''';
  }
}
