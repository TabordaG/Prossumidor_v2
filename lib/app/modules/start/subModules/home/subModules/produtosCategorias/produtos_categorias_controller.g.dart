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
  final _$buscarTextAtom =
      Atom(name: '_ProdutosCategoriasControllerBase.buscarText');

  @override
  TextEditingController get buscarText {
    _$buscarTextAtom.reportRead();
    return super.buscarText;
  }

  @override
  set buscarText(TextEditingController value) {
    _$buscarTextAtom.reportWrite(value, super.buscarText, () {
      super.buscarText = value;
    });
  }

  final _$isSearchingAtom =
      Atom(name: '_ProdutosCategoriasControllerBase.isSearching');

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  final _$subcategoriasAtom =
      Atom(name: '_ProdutosCategoriasControllerBase.subcategorias');

  @override
  List<Subcategoria> get subcategorias {
    _$subcategoriasAtom.reportRead();
    return super.subcategorias;
  }

  @override
  set subcategorias(List<Subcategoria> value) {
    _$subcategoriasAtom.reportWrite(value, super.subcategorias, () {
      super.subcategorias = value;
    });
  }

  final _$_ProdutosCategoriasControllerBaseActionController =
      ActionController(name: '_ProdutosCategoriasControllerBase');

  @override
  dynamic setIsSearching() {
    final _$actionInfo = _$_ProdutosCategoriasControllerBaseActionController
        .startAction(name: '_ProdutosCategoriasControllerBase.setIsSearching');
    try {
      return super.setIsSearching();
    } finally {
      _$_ProdutosCategoriasControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic buscarProduto() {
    final _$actionInfo = _$_ProdutosCategoriasControllerBaseActionController
        .startAction(name: '_ProdutosCategoriasControllerBase.buscarProduto');
    try {
      return super.buscarProduto();
    } finally {
      _$_ProdutosCategoriasControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic selecionarSubcategoria(int index) {
    final _$actionInfo =
        _$_ProdutosCategoriasControllerBaseActionController.startAction(
            name: '_ProdutosCategoriasControllerBase.selecionarSubcategoria');
    try {
      return super.selecionarSubcategoria(index);
    } finally {
      _$_ProdutosCategoriasControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
buscarText: ${buscarText},
isSearching: ${isSearching},
subcategorias: ${subcategorias}
    ''';
  }
}
