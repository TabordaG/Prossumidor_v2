// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedidos_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PedidosController = BindInject(
  (i) => PedidosController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PedidosController on _PedidosControllerBase, Store {
  final _$pedidosNaoEntregueListAtom =
      Atom(name: '_PedidosControllerBase.pedidosNaoEntregueList');

  @override
  List<Pedidos> get pedidosNaoEntregueList {
    _$pedidosNaoEntregueListAtom.reportRead();
    return super.pedidosNaoEntregueList;
  }

  @override
  set pedidosNaoEntregueList(List<Pedidos> value) {
    _$pedidosNaoEntregueListAtom
        .reportWrite(value, super.pedidosNaoEntregueList, () {
      super.pedidosNaoEntregueList = value;
    });
  }

  final _$pedidosEntregueListAtom =
      Atom(name: '_PedidosControllerBase.pedidosEntregueList');

  @override
  List<Pedidos> get pedidosEntregueList {
    _$pedidosEntregueListAtom.reportRead();
    return super.pedidosEntregueList;
  }

  @override
  set pedidosEntregueList(List<Pedidos> value) {
    _$pedidosEntregueListAtom.reportWrite(value, super.pedidosEntregueList, () {
      super.pedidosEntregueList = value;
    });
  }

  final _$produtosListAtom = Atom(name: '_PedidosControllerBase.produtosList');

  @override
  List<Produto> get produtosList {
    _$produtosListAtom.reportRead();
    return super.produtosList;
  }

  @override
  set produtosList(List<Produto> value) {
    _$produtosListAtom.reportWrite(value, super.produtosList, () {
      super.produtosList = value;
    });
  }

  final _$chamarListaNaoEntregueAsyncAction =
      AsyncAction('_PedidosControllerBase.chamarListaNaoEntregue');

  @override
  Future chamarListaNaoEntregue() {
    return _$chamarListaNaoEntregueAsyncAction
        .run(() => super.chamarListaNaoEntregue());
  }

  final _$chamarListaEntregueAsyncAction =
      AsyncAction('_PedidosControllerBase.chamarListaEntregue');

  @override
  Future chamarListaEntregue() {
    return _$chamarListaEntregueAsyncAction
        .run(() => super.chamarListaEntregue());
  }

  final _$buscarProdutosAsyncAction =
      AsyncAction('_PedidosControllerBase.buscarProdutos');

  @override
  Future buscarProdutos(int id) {
    return _$buscarProdutosAsyncAction.run(() => super.buscarProdutos(id));
  }

  @override
  String toString() {
    return '''
pedidosNaoEntregueList: ${pedidosNaoEntregueList},
pedidosEntregueList: ${pedidosEntregueList},
produtosList: ${produtosList}
    ''';
  }
}
