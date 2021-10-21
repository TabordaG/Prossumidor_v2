// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_detalhes_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ProdutoDetalhesController = BindInject(
  (i) => ProdutoDetalhesController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoDetalhesController on _ProdutoDetalhesControllerBase, Store {
  final _$produtoAtom = Atom(name: '_ProdutoDetalhesControllerBase.produto');

  @override
  Produto get produto {
    _$produtoAtom.reportRead();
    return super.produto;
  }

  @override
  set produto(Produto value) {
    _$produtoAtom.reportWrite(value, super.produto, () {
      super.produto = value;
    });
  }

  final _$valueAtom = Atom(name: '_ProdutoDetalhesControllerBase.value');

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

  final _$setProdutoAsyncAction =
      AsyncAction('_ProdutoDetalhesControllerBase.setProduto');

  @override
  Future setProduto(Produto produtoReceived) {
    return _$setProdutoAsyncAction.run(() => super.setProduto(produtoReceived));
  }

  final _$_ProdutoDetalhesControllerBaseActionController =
      ActionController(name: '_ProdutoDetalhesControllerBase');

  @override
  void increment(int limite) {
    final _$actionInfo = _$_ProdutoDetalhesControllerBaseActionController
        .startAction(name: '_ProdutoDetalhesControllerBase.increment');
    try {
      return super.increment(limite);
    } finally {
      _$_ProdutoDetalhesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_ProdutoDetalhesControllerBaseActionController
        .startAction(name: '_ProdutoDetalhesControllerBase.decrement');
    try {
      return super.decrement();
    } finally {
      _$_ProdutoDetalhesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
produto: ${produto},
value: ${value}
    ''';
  }
}
