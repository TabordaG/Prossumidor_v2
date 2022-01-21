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
  final _$mensagemVendedorAtom =
      Atom(name: '_PedidosControllerBase.mensagemVendedor');

  @override
  TextEditingController get mensagemVendedor {
    _$mensagemVendedorAtom.reportRead();
    return super.mensagemVendedor;
  }

  @override
  set mensagemVendedor(TextEditingController value) {
    _$mensagemVendedorAtom.reportWrite(value, super.mensagemVendedor, () {
      super.mensagemVendedor = value;
    });
  }

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

  final _$pedidosEmAndamentoAtom =
      Atom(name: '_PedidosControllerBase.pedidosEmAndamento');

  @override
  List<Pedidos> get pedidosEmAndamento {
    _$pedidosEmAndamentoAtom.reportRead();
    return super.pedidosEmAndamento;
  }

  @override
  set pedidosEmAndamento(List<Pedidos> value) {
    _$pedidosEmAndamentoAtom.reportWrite(value, super.pedidosEmAndamento, () {
      super.pedidosEmAndamento = value;
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

  final _$chamarListaEntregueAsyncAction =
      AsyncAction('_PedidosControllerBase.chamarListaEntregue');

  @override
  Future chamarListaEntregue() {
    return _$chamarListaEntregueAsyncAction
        .run(() => super.chamarListaEntregue());
  }

  final _$chamarMaisListaEntregueAsyncAction =
      AsyncAction('_PedidosControllerBase.chamarMaisListaEntregue');

  @override
  Future chamarMaisListaEntregue(BuildContext context, SnackBar snackBar) {
    return _$chamarMaisListaEntregueAsyncAction
        .run(() => super.chamarMaisListaEntregue(context, snackBar));
  }

  final _$chamarListaEmAndamentoAsyncAction =
      AsyncAction('_PedidosControllerBase.chamarListaEmAndamento');

  @override
  Future chamarListaEmAndamento() {
    return _$chamarListaEmAndamentoAsyncAction
        .run(() => super.chamarListaEmAndamento());
  }

  final _$chamarMaisListaEmAndamentoAsyncAction =
      AsyncAction('_PedidosControllerBase.chamarMaisListaEmAndamento');

  @override
  Future chamarMaisListaEmAndamento(BuildContext context, SnackBar snackBar) {
    return _$chamarMaisListaEmAndamentoAsyncAction
        .run(() => super.chamarMaisListaEmAndamento(context, snackBar));
  }

  final _$chamarListaNaoEntregueCanceladoAsyncAction =
      AsyncAction('_PedidosControllerBase.chamarListaNaoEntregueCancelado');

  @override
  Future chamarListaNaoEntregueCancelado() {
    return _$chamarListaNaoEntregueCanceladoAsyncAction
        .run(() => super.chamarListaNaoEntregueCancelado());
  }

  final _$chamarMaisListaNaoEntregueCanceladoAsyncAction =
      AsyncAction('_PedidosControllerBase.chamarMaisListaNaoEntregueCancelado');

  @override
  Future chamarMaisListaNaoEntregueCancelado(
      BuildContext context, SnackBar snackBar) {
    return _$chamarMaisListaNaoEntregueCanceladoAsyncAction.run(
        () => super.chamarMaisListaNaoEntregueCancelado(context, snackBar));
  }

  final _$buscarProdutosAsyncAction =
      AsyncAction('_PedidosControllerBase.buscarProdutos');

  @override
  Future buscarProdutos(int id) {
    return _$buscarProdutosAsyncAction.run(() => super.buscarProdutos(id));
  }

  final _$enviaMensagemAsyncAction =
      AsyncAction('_PedidosControllerBase.enviaMensagem');

  @override
  Future enviaMensagem(String mensagemVendedor, int marcaId, int usuarioID) {
    return _$enviaMensagemAsyncAction
        .run(() => super.enviaMensagem(mensagemVendedor, marcaId, usuarioID));
  }

  final _$cancelaPedidoAsyncAction =
      AsyncAction('_PedidosControllerBase.cancelaPedido');

  @override
  Future cancelaPedido(int pedidoID, String status) {
    return _$cancelaPedidoAsyncAction
        .run(() => super.cancelaPedido(pedidoID, status));
  }

  @override
  String toString() {
    return '''
mensagemVendedor: ${mensagemVendedor},
pedidosNaoEntregueList: ${pedidosNaoEntregueList},
pedidosEntregueList: ${pedidosEntregueList},
pedidosEmAndamento: ${pedidosEmAndamento},
produtosList: ${produtosList}
    ''';
  }
}
