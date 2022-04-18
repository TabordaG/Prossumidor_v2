// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PerfilController = BindInject(
  (i) => PerfilController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerfilController on _PerfilControllerBase, Store {
  final _$centroDistribuicaoAtom =
      Atom(name: '_PerfilControllerBase.centroDistribuicao');

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

  final _$nomeAtom = Atom(name: '_PerfilControllerBase.nome');

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

  final _$scrollControllerAtom =
      Atom(name: '_PerfilControllerBase.scrollController');

  @override
  ScrollController get scrollController {
    _$scrollControllerAtom.reportRead();
    return super.scrollController;
  }

  @override
  set scrollController(ScrollController value) {
    _$scrollControllerAtom.reportWrite(value, super.scrollController, () {
      super.scrollController = value;
    });
  }

  final _$setCentroDistribuicaoAsyncAction =
      AsyncAction('_PerfilControllerBase.setCentroDistribuicao');

  @override
  Future<String> setCentroDistribuicao() {
    return _$setCentroDistribuicaoAsyncAction
        .run(() => super.setCentroDistribuicao());
  }

  final _$setNomeAsyncAction = AsyncAction('_PerfilControllerBase.setNome');

  @override
  Future<String> setNome() {
    return _$setNomeAsyncAction.run(() => super.setNome());
  }

  final _$buscaUsuarioAsyncAction =
      AsyncAction('_PerfilControllerBase.buscaUsuario');

  @override
  Future<dynamic> buscaUsuario() {
    return _$buscaUsuarioAsyncAction.run(() => super.buscaUsuario());
  }

  @override
  String toString() {
    return '''
centroDistribuicao: ${centroDistribuicao},
nome: ${nome},
scrollController: ${scrollController}
    ''';
  }
}
