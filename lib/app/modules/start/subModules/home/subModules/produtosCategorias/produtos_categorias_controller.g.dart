// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produtos_categorias_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ProdutosCategoriasController = BindInject(
  (i) => ProdutosCategoriasController(),
  isSingleton: true,
  isLazy: true,
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

  final _$categoriasIDsAtom =
      Atom(name: '_ProdutosCategoriasControllerBase.categoriasIDs');

  @override
  List<int> get categoriasIDs {
    _$categoriasIDsAtom.reportRead();
    return super.categoriasIDs;
  }

  @override
  set categoriasIDs(List<int> value) {
    _$categoriasIDsAtom.reportWrite(value, super.categoriasIDs, () {
      super.categoriasIDs = value;
    });
  }

  final _$listaProdutosAtom =
      Atom(name: '_ProdutosCategoriasControllerBase.listaProdutos');

  @override
  List<Produto> get listaProdutos {
    _$listaProdutosAtom.reportRead();
    return super.listaProdutos;
  }

  @override
  set listaProdutos(List<Produto> value) {
    _$listaProdutosAtom.reportWrite(value, super.listaProdutos, () {
      super.listaProdutos = value;
    });
  }

  final _$buscandoProdutosAtom =
      Atom(name: '_ProdutosCategoriasControllerBase.buscandoProdutos');

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
      Atom(name: '_ProdutosCategoriasControllerBase.buscandoMaisProdutos');

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

  final _$habilitarNovaBuscaAtom =
      Atom(name: '_ProdutosCategoriasControllerBase.habilitarNovaBusca');

  @override
  bool get habilitarNovaBusca {
    _$habilitarNovaBuscaAtom.reportRead();
    return super.habilitarNovaBusca;
  }

  @override
  set habilitarNovaBusca(bool value) {
    _$habilitarNovaBuscaAtom.reportWrite(value, super.habilitarNovaBusca, () {
      super.habilitarNovaBusca = value;
    });
  }

  final _$pesquisarProdutoAsyncAction =
      AsyncAction('_ProdutosCategoriasControllerBase.pesquisarProduto');

  @override
  Future pesquisarProduto(bool isCategoria, MarcaProduto marcaProduto,
      CategoriaProduto categoriaProduto) {
    return _$pesquisarProdutoAsyncAction.run(() =>
        super.pesquisarProduto(isCategoria, marcaProduto, categoriaProduto));
  }

  final _$selecionarSubcategoriaAsyncAction =
      AsyncAction('_ProdutosCategoriasControllerBase.selecionarSubcategoria');

  @override
  Future selecionarSubcategoria(int index, bool isCategoria,
      MarcaProduto? marcaProduto, CategoriaProduto categoriaProduto) {
    return _$selecionarSubcategoriaAsyncAction.run(() => super
        .selecionarSubcategoria(
            index, isCategoria, marcaProduto, categoriaProduto));
  }

  final _$carregarProdutosAsyncAction =
      AsyncAction('_ProdutosCategoriasControllerBase.carregarProdutos');

  @override
  Future carregarProdutos(bool isCategoria, MarcaProduto? marcaProduto,
      CategoriaProduto categoriaProduto) {
    return _$carregarProdutosAsyncAction.run(() =>
        super.carregarProdutos(isCategoria, marcaProduto, categoriaProduto));
  }

  final _$carregarMaisProdutosAsyncAction =
      AsyncAction('_ProdutosCategoriasControllerBase.carregarMaisProdutos');

  @override
  Future carregarMaisProdutos(BuildContext context, bool isCategoria,
      MarcaProduto marcaProduto, CategoriaProduto categoriaProduto) {
    return _$carregarMaisProdutosAsyncAction.run(() => super
        .carregarMaisProdutos(
            context, isCategoria, marcaProduto, categoriaProduto));
  }

  final _$buscarSubcategoriasAsyncAction =
      AsyncAction('_ProdutosCategoriasControllerBase.buscarSubcategorias');

  @override
  Future buscarSubcategorias(int id) {
    return _$buscarSubcategoriasAsyncAction
        .run(() => super.buscarSubcategorias(id));
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
  String toString() {
    return '''
buscarText: ${buscarText},
isSearching: ${isSearching},
subcategorias: ${subcategorias},
categoriasIDs: ${categoriasIDs},
listaProdutos: ${listaProdutos},
buscandoProdutos: ${buscandoProdutos},
buscandoMaisProdutos: ${buscandoMaisProdutos},
habilitarNovaBusca: ${habilitarNovaBusca}
    ''';
  }
}
