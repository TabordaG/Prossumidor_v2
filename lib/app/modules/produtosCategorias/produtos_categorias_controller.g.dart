// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produtos_categorias_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ProdutosCategoriasController = BindInject(
  (i) => ProdutosCategoriasController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutosCategoriasController
    on _ProdutosCategoriasControllerBase, Store {
  final _$valueAtom = Atom(name: '_ProdutosCategoriasControllerBase.value');

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

  final _$_ProdutosCategoriasControllerBaseActionController =
      ActionController(name: '_ProdutosCategoriasControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_ProdutosCategoriasControllerBaseActionController
        .startAction(name: '_ProdutosCategoriasControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ProdutosCategoriasControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
