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

  final _$nomeCompletoAtom = Atom(name: '_AuthControllerBase.nomeCompleto');

  @override
  String get nomeCompleto {
    _$nomeCompletoAtom.reportRead();
    return super.nomeCompleto;
  }

  @override
  set nomeCompleto(String value) {
    _$nomeCompletoAtom.reportWrite(value, super.nomeCompleto, () {
      super.nomeCompleto = value;
    });
  }

  final _$centroDistribuicaoAtom =
      Atom(name: '_AuthControllerBase.centroDistribuicao');

  @override
  String get centroDistribuicao {
    _$centroDistribuicaoAtom.reportRead();
    return super.centroDistribuicao;
  }

  @override
  set centroDistribuicao(String value) {
    _$centroDistribuicaoAtom.reportWrite(value, super.centroDistribuicao, () {
      super.centroDistribuicao = value;
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

  final _$mensagemVersaoAtom = Atom(name: '_AuthControllerBase.mensagemVersao');

  @override
  String get mensagemVersao {
    _$mensagemVersaoAtom.reportRead();
    return super.mensagemVersao;
  }

  @override
  set mensagemVersao(String value) {
    _$mensagemVersaoAtom.reportWrite(value, super.mensagemVersao, () {
      super.mensagemVersao = value;
    });
  }

  final _$temMensagemAtom = Atom(name: '_AuthControllerBase.temMensagem');

  @override
  bool get temMensagem {
    _$temMensagemAtom.reportRead();
    return super.temMensagem;
  }

  @override
  set temMensagem(bool value) {
    _$temMensagemAtom.reportWrite(value, super.temMensagem, () {
      super.temMensagem = value;
    });
  }

  final _$verificaLogadoAsyncAction =
      AsyncAction('_AuthControllerBase.verificaLogado');

  @override
  Future verificaLogado() {
    return _$verificaLogadoAsyncAction.run(() => super.verificaLogado());
  }

  final _$setCentroDistribuicaoAsyncAction =
      AsyncAction('_AuthControllerBase.setCentroDistribuicao');

  @override
  Future<String> setCentroDistribuicao() {
    return _$setCentroDistribuicaoAsyncAction
        .run(() => super.setCentroDistribuicao());
  }

  final _$setNomeAsyncAction = AsyncAction('_AuthControllerBase.setNome');

  @override
  Future<String> setNome() {
    return _$setNomeAsyncAction.run(() => super.setNome());
  }

  final _$buscaUsuarioCompletoAsyncAction =
      AsyncAction('_AuthControllerBase.buscaUsuarioCompleto');

  @override
  Future<dynamic> buscaUsuarioCompleto() {
    return _$buscaUsuarioCompletoAsyncAction
        .run(() => super.buscaUsuarioCompleto());
  }

  final _$buscaMensagemAsyncAction =
      AsyncAction('_AuthControllerBase.buscaMensagem');

  @override
  Future<dynamic> buscaMensagem() {
    return _$buscaMensagemAsyncAction.run(() => super.buscaMensagem());
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
nomeCompleto: ${nomeCompleto},
centroDistribuicao: ${centroDistribuicao},
localRetirada: ${localRetirada},
localRetiradaAtual: ${localRetiradaAtual},
versaoAtual: ${versaoAtual},
mensagemVersao: ${mensagemVersao},
temMensagem: ${temMensagem}
    ''';
  }
}
