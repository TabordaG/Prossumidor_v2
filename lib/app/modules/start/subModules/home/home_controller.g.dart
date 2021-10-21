// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$refreshPageAtom = Atom(name: '_HomeControllerBase.refreshPage');

  @override
  bool get refreshPage {
    _$refreshPageAtom.reportRead();
    return super.refreshPage;
  }

  @override
  set refreshPage(bool value) {
    _$refreshPageAtom.reportWrite(value, super.refreshPage, () {
      super.refreshPage = value;
    });
  }

  final _$categoriasIDAtom = Atom(name: '_HomeControllerBase.categoriasID');

  @override
  List<dynamic> get categoriasID {
    _$categoriasIDAtom.reportRead();
    return super.categoriasID;
  }

  @override
  set categoriasID(List<dynamic> value) {
    _$categoriasIDAtom.reportWrite(value, super.categoriasID, () {
      super.categoriasID = value;
    });
  }

  final _$scrollControllerAtom =
      Atom(name: '_HomeControllerBase.scrollController');

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

  final _$offsetHomeListAtom = Atom(name: '_HomeControllerBase.offsetHomeList');

  @override
  double get offsetHomeList {
    _$offsetHomeListAtom.reportRead();
    return super.offsetHomeList;
  }

  @override
  set offsetHomeList(double value) {
    _$offsetHomeListAtom.reportWrite(value, super.offsetHomeList, () {
      super.offsetHomeList = value;
    });
  }

  final _$buscarStringAtom = Atom(name: '_HomeControllerBase.buscarString');

  @override
  String get buscarString {
    _$buscarStringAtom.reportRead();
    return super.buscarString;
  }

  @override
  set buscarString(String value) {
    _$buscarStringAtom.reportWrite(value, super.buscarString, () {
      super.buscarString = value;
    });
  }

  final _$listaCategoriasAtom =
      Atom(name: '_HomeControllerBase.listaCategorias');

  @override
  List<Categoria> get listaCategorias {
    _$listaCategoriasAtom.reportRead();
    return super.listaCategorias;
  }

  @override
  set listaCategorias(List<Categoria> value) {
    _$listaCategoriasAtom.reportWrite(value, super.listaCategorias, () {
      super.listaCategorias = value;
    });
  }

  final _$listaCategoriaProdutosAtom =
      Atom(name: '_HomeControllerBase.listaCategoriaProdutos');

  @override
  List<CategoriaProduto> get listaCategoriaProdutos {
    _$listaCategoriaProdutosAtom.reportRead();
    return super.listaCategoriaProdutos;
  }

  @override
  set listaCategoriaProdutos(List<CategoriaProduto> value) {
    _$listaCategoriaProdutosAtom
        .reportWrite(value, super.listaCategoriaProdutos, () {
      super.listaCategoriaProdutos = value;
    });
  }

  final _$buscarCategoriasAsyncAction =
      AsyncAction('_HomeControllerBase.buscarCategorias');

  @override
  Future buscarCategorias() {
    return _$buscarCategoriasAsyncAction.run(() => super.buscarCategorias());
  }

  final _$buscarProdutosPorCategoriaIDAsyncAction =
      AsyncAction('_HomeControllerBase.buscarProdutosPorCategoriaID');

  @override
  Future buscarProdutosPorCategoriaID() {
    return _$buscarProdutosPorCategoriaIDAsyncAction
        .run(() => super.buscarProdutosPorCategoriaID());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setRefreshTrue() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setRefreshTrue');
    try {
      return super.setRefreshTrue();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setOffsetHomeList(double valor) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setOffsetHomeList');
    try {
      return super.setOffsetHomeList(valor);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setBuscarString(String valor) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setBuscarString');
    try {
      return super.setBuscarString(valor);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic iniciarHome() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.iniciarHome');
    try {
      return super.iniciarHome();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
refreshPage: ${refreshPage},
categoriasID: ${categoriasID},
scrollController: ${scrollController},
offsetHomeList: ${offsetHomeList},
buscarString: ${buscarString},
listaCategorias: ${listaCategorias},
listaCategoriaProdutos: ${listaCategoriaProdutos}
    ''';
  }
}
