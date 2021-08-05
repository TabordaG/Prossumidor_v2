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
  final _$pedidosListAtom = Atom(name: '_PedidosControllerBase.pedidosList');

  @override
  List<Pedidos> get pedidosList {
    _$pedidosListAtom.reportRead();
    return super.pedidosList;
  }

  @override
  set pedidosList(List<Pedidos> value) {
    _$pedidosListAtom.reportWrite(value, super.pedidosList, () {
      super.pedidosList = value;
    });
  }

  final _$chamarListaAsyncAction =
      AsyncAction('_PedidosControllerBase.chamarLista');

  @override
  Future chamarLista() {
    return _$chamarListaAsyncAction.run(() => super.chamarLista());
  }

  @override
  String toString() {
    return '''
pedidosList: ${pedidosList}
    ''';
  }
}
