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

  final _$listaMarcasAtom = Atom(name: '_HomeControllerBase.listaMarcas');

  @override
  List<Marca> get listaMarcas {
    _$listaMarcasAtom.reportRead();
    return super.listaMarcas;
  }

  @override
  set listaMarcas(List<Marca> value) {
    _$listaMarcasAtom.reportWrite(value, super.listaMarcas, () {
      super.listaMarcas = value;
    });
  }

  final _$marcaSelecionadaAtom =
      Atom(name: '_HomeControllerBase.marcaSelecionada');

  @override
  String get marcaSelecionada {
    _$marcaSelecionadaAtom.reportRead();
    return super.marcaSelecionada;
  }

  @override
  set marcaSelecionada(String value) {
    _$marcaSelecionadaAtom.reportWrite(value, super.marcaSelecionada, () {
      super.marcaSelecionada = value;
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
  TextEditingController get buscarString {
    _$buscarStringAtom.reportRead();
    return super.buscarString;
  }

  @override
  set buscarString(TextEditingController value) {
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

  final _$listaMarcaProdutosAtom =
      Atom(name: '_HomeControllerBase.listaMarcaProdutos');

  @override
  List<MarcaProduto> get listaMarcaProdutos {
    _$listaMarcaProdutosAtom.reportRead();
    return super.listaMarcaProdutos;
  }

  @override
  set listaMarcaProdutos(List<MarcaProduto> value) {
    _$listaMarcaProdutosAtom.reportWrite(value, super.listaMarcaProdutos, () {
      super.listaMarcaProdutos = value;
    });
  }

  final _$produtosDaBuscaAtom =
      Atom(name: '_HomeControllerBase.produtosDaBusca');

  @override
  List<Produto> get produtosDaBusca {
    _$produtosDaBuscaAtom.reportRead();
    return super.produtosDaBusca;
  }

  @override
  set produtosDaBusca(List<Produto> value) {
    _$produtosDaBuscaAtom.reportWrite(value, super.produtosDaBusca, () {
      super.produtosDaBusca = value;
    });
  }

  final _$buscandoProdutosAtom =
      Atom(name: '_HomeControllerBase.buscandoProdutos');

  @override
  bool get buscandoProdutos {
    _$buscandoProdutosAtom.reportRead();
    return super.buscandoProdutos;
  }

  @override
  set buscandoProdutos(bool value) {
    _$buscandoProdutosAtom.reportWrite(value, super.buscandoProdutos, () {
      super.buscandoProdutos = value;
    });
  }

  final _$buscandoMaisProdutosAtom =
      Atom(name: '_HomeControllerBase.buscandoMaisProdutos');

  @override
  bool get buscandoMaisProdutos {
    _$buscandoMaisProdutosAtom.reportRead();
    return super.buscandoMaisProdutos;
  }

  @override
  set buscandoMaisProdutos(bool value) {
    _$buscandoMaisProdutosAtom.reportWrite(value, super.buscandoMaisProdutos,
        () {
      super.buscandoMaisProdutos = value;
    });
  }

  final _$bannerAtom = Atom(name: '_HomeControllerBase.banner');

  @override
  List<String> get banner {
    _$bannerAtom.reportRead();
    return super.banner;
  }

  @override
  set banner(List<String> value) {
    _$bannerAtom.reportWrite(value, super.banner, () {
      super.banner = value;
    });
  }

  final _$setRefreshTrueAsyncAction =
      AsyncAction('_HomeControllerBase.setRefreshTrue');

  @override
  Future setRefreshTrue() {
    return _$setRefreshTrueAsyncAction.run(() => super.setRefreshTrue());
  }

  final _$iniciarHomeAsyncAction =
      AsyncAction('_HomeControllerBase.iniciarHome');

  @override
  Future iniciarHome() {
    return _$iniciarHomeAsyncAction.run(() => super.iniciarHome());
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

  final _$buscarProdutosPorMarcasAsyncAction =
      AsyncAction('_HomeControllerBase.buscarProdutosPorMarcas');

  @override
  Future buscarProdutosPorMarcas() {
    return _$buscarProdutosPorMarcasAsyncAction
        .run(() => super.buscarProdutosPorMarcas());
  }

  final _$buscarMarcasAsyncAction =
      AsyncAction('_HomeControllerBase.buscarMarcas');

  @override
  Future buscarMarcas() {
    return _$buscarMarcasAsyncAction.run(() => super.buscarMarcas());
  }

  final _$confirmarMarcaAsyncAction =
      AsyncAction('_HomeControllerBase.confirmarMarca');

  @override
  Future confirmarMarca() {
    return _$confirmarMarcaAsyncAction.run(() => super.confirmarMarca());
  }

  final _$pesquisarProdutoAsyncAction =
      AsyncAction('_HomeControllerBase.pesquisarProduto');

  @override
  Future pesquisarProduto() {
    return _$pesquisarProdutoAsyncAction.run(() => super.pesquisarProduto());
  }

  final _$pesquisarMaisProdutosAsyncAction =
      AsyncAction('_HomeControllerBase.pesquisarMaisProdutos');

  @override
  Future pesquisarMaisProdutos() {
    return _$pesquisarMaisProdutosAsyncAction
        .run(() => super.pesquisarMaisProdutos());
  }

  final _$implementaBannerAsyncAction =
      AsyncAction('_HomeControllerBase.implementaBanner');

  @override
  Future implementaBanner() {
    return _$implementaBannerAsyncAction.run(() => super.implementaBanner());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

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
  dynamic resetBuscarString() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.resetBuscarString');
    try {
      return super.resetBuscarString();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selecionarMarca(int index, bool selecionar) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.selecionarMarca');
    try {
      return super.selecionarMarca(index, selecionar);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetarMarcas() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.resetarMarcas');
    try {
      return super.resetarMarcas();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
refreshPage: ${refreshPage},
categoriasID: ${categoriasID},
listaMarcas: ${listaMarcas},
marcaSelecionada: ${marcaSelecionada},
scrollController: ${scrollController},
offsetHomeList: ${offsetHomeList},
buscarString: ${buscarString},
listaCategorias: ${listaCategorias},
listaCategoriaProdutos: ${listaCategoriaProdutos},
listaMarcaProdutos: ${listaMarcaProdutos},
produtosDaBusca: ${produtosDaBusca},
buscandoProdutos: ${buscandoProdutos},
buscandoMaisProdutos: ${buscandoMaisProdutos},
banner: ${banner}
    ''';
  }
}
