// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<List<Marca?>>? _$filtroMarcaComputed;

  @override
  List<Marca?> get filtroMarca =>
      (_$filtroMarcaComputed ??= Computed<List<Marca?>>(() => super.filtroMarca,
              name: '_HomeControllerBase.filtroMarca'))
          .value;
  Computed<List<Categoria?>>? _$filtroCategoriaComputed;

  @override
  List<Categoria?> get filtroCategoria => (_$filtroCategoriaComputed ??=
          Computed<List<Categoria?>>(() => super.filtroCategoria,
              name: '_HomeControllerBase.filtroCategoria'))
      .value;

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

  final _$isFilteringAtom = Atom(name: '_HomeControllerBase.isFiltering');

  @override
  bool get isFiltering {
    _$isFilteringAtom.reportRead();
    return super.isFiltering;
  }

  @override
  set isFiltering(bool value) {
    _$isFilteringAtom.reportWrite(value, super.isFiltering, () {
      super.isFiltering = value;
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
  List<Marca>? get listaMarcas {
    _$listaMarcasAtom.reportRead();
    return super.listaMarcas;
  }

  @override
  set listaMarcas(List<Marca>? value) {
    _$listaMarcasAtom.reportWrite(value, super.listaMarcas, () {
      super.listaMarcas = value;
    });
  }

  final _$marcaSelecionadaAtom =
      Atom(name: '_HomeControllerBase.marcaSelecionada');

  @override
  bool get marcaSelecionada {
    _$marcaSelecionadaAtom.reportRead();
    return super.marcaSelecionada;
  }

  @override
  set marcaSelecionada(bool value) {
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

  final _$buscarMarcaAtom = Atom(name: '_HomeControllerBase.buscarMarca');

  @override
  TextEditingController get buscarMarca {
    _$buscarMarcaAtom.reportRead();
    return super.buscarMarca;
  }

  @override
  set buscarMarca(TextEditingController value) {
    _$buscarMarcaAtom.reportWrite(value, super.buscarMarca, () {
      super.buscarMarca = value;
    });
  }

  final _$buscarCategoriaAtom =
      Atom(name: '_HomeControllerBase.buscarCategoria');

  @override
  TextEditingController get buscarCategoria {
    _$buscarCategoriaAtom.reportRead();
    return super.buscarCategoria;
  }

  @override
  set buscarCategoria(TextEditingController value) {
    _$buscarCategoriaAtom.reportWrite(value, super.buscarCategoria, () {
      super.buscarCategoria = value;
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

  final _$listaCategoriasFiltroAtom =
      Atom(name: '_HomeControllerBase.listaCategoriasFiltro');

  @override
  List<Categoria> get listaCategoriasFiltro {
    _$listaCategoriasFiltroAtom.reportRead();
    return super.listaCategoriasFiltro;
  }

  @override
  set listaCategoriasFiltro(List<Categoria> value) {
    _$listaCategoriasFiltroAtom.reportWrite(value, super.listaCategoriasFiltro,
        () {
      super.listaCategoriasFiltro = value;
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

  final _$confirmarMarcaCategoriaAsyncAction =
      AsyncAction('_HomeControllerBase.confirmarMarcaCategoria');

  @override
  Future confirmarMarcaCategoria(int index) {
    return _$confirmarMarcaCategoriaAsyncAction
        .run(() => super.confirmarMarcaCategoria(index));
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
  dynamic atualizaListaMarca() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.atualizaListaMarca');
    try {
      return super.atualizaListaMarca();
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
  dynamic resetarMarcasCategoria(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.resetarMarcasCategoria');
    try {
      return super.resetarMarcasCategoria(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selecionarCategoria(int index, bool selecionar) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.selecionarCategoria');
    try {
      return super.selecionarCategoria(index, selecionar);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic atualizaListaCategoria() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.atualizaListaCategoria');
    try {
      return super.atualizaListaCategoria();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
refreshPage: ${refreshPage},
isFiltering: ${isFiltering},
categoriasID: ${categoriasID},
listaMarcas: ${listaMarcas},
marcaSelecionada: ${marcaSelecionada},
scrollController: ${scrollController},
offsetHomeList: ${offsetHomeList},
buscarMarca: ${buscarMarca},
buscarCategoria: ${buscarCategoria},
buscarString: ${buscarString},
listaCategorias: ${listaCategorias},
listaCategoriasFiltro: ${listaCategoriasFiltro},
listaCategoriaProdutos: ${listaCategoriaProdutos},
listaMarcaProdutos: ${listaMarcaProdutos},
produtosDaBusca: ${produtosDaBusca},
buscandoProdutos: ${buscandoProdutos},
buscandoMaisProdutos: ${buscandoMaisProdutos},
banner: ${banner},
filtroMarca: ${filtroMarca},
filtroCategoria: ${filtroCategoria}
    ''';
  }
}
