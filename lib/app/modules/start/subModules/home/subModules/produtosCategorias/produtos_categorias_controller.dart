import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/models/categoria/categoria_model.dart';
import 'package:prossumidor_v2/app/models/marca/marca_model.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';
import 'package:prossumidor_v2/app/models/subcategoria/subcategoria_model.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/home/home_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/home/subModules/produtosCategorias/repositories/produtos_categorias_repository.dart';

part 'produtos_categorias_controller.g.dart';

@Injectable()
class ProdutosCategoriasController = _ProdutosCategoriasControllerBase
    with _$ProdutosCategoriasController;

abstract class _ProdutosCategoriasControllerBase with Store {
  HomeController homeController = HomeController();
  ProdutosCategoriasRepository produtosCategoriasRepository =
      ProdutosCategoriasRepository();
  _ProdutosCategoriasControllerBase() {
    // if (subcategorias.isEmpty) {
    //   print("Entrou");
    // subcategoriaList.forEach((element) {
    //     subcategorias.add(element);
    //   });
    // }
  }
  @observable
  TextEditingController buscarText = TextEditingController();

  @observable
  bool isSearching = false;

  @action
  setIsSearching() {
    isSearching = !isSearching;
    if (!isSearching) buscarText.clear();
  }

  @action
  pesquisarProduto() {}

  @observable
  List<Subcategoria> subcategorias = [];

  @observable
  List<int> categoriasIDs = [];

  @action
  selecionarSubcategoria(
    int index,
    bool isCategoria,
    MarcaProduto marcaProduto,
    CategoriaProduto categoriaProduto,
  ) async {
    categoriasIDs = [];
    subcategorias[index].ativo = !subcategorias[index].ativo;

    if (index != 0 && subcategorias[index].ativo)
      subcategorias[0].ativo = false;

    if (index == 0 && subcategorias[index].ativo)
      for (var i = 1; i < subcategorias.length; i++) {
        subcategorias[i].ativo = false;
      }

    int verifica = 0;
    for (var i = 1; i < subcategorias.length; i++) {
      if (subcategorias[i].ativo == true) {
        verifica = 1;
        categoriasIDs.add(subcategorias[i].subcategoria_id);
      }
    }
    // subcategorias.forEach((element) {
    //   if (element.ativo == true) {
    //     verifica = 1;
    //   }
    // });
    subcategorias = List.from(subcategorias);
    if (verifica == 0) {
      subcategorias[0].ativo = true;
      subcategorias = List.from(subcategorias);
      carregarProdutos(isCategoria, marcaProduto, categoriaProduto);
    } else {
      listaProdutos = [];
      buscandoProdutos = true;
      print(categoriasIDs);
      List<Produto> res =
          await produtosCategoriasRepository.listaProdutosEmComum(
        categoriaProduto.categoria.id,
        categoriasIDs,
        listaProdutos.length,
      );
      if (res != null) listaProdutos = res;
      listaProdutos = List.from(listaProdutos);
      buscandoProdutos = false;
    }
  }

  @observable
  List<Produto> listaProdutos = [];

  @observable
  bool buscandoProdutos = false;

  @action
  carregarProdutos(bool isCategoria, MarcaProduto marcaProduto,
      CategoriaProduto categoriaProduto) async {
    listaProdutos = [];
    buscandoProdutos = true;
    if (isCategoria) {
      listaProdutos =
          await produtosCategoriasRepository.listaProdutosPorCategoria(
              categoriaProduto.categoria.id, listaProdutos.length);
    } else {
      listaProdutos = await produtosCategoriasRepository.listaProdutosPorMarca(
          marcaProduto.marca.id, listaProdutos.length);
    }
    listaProdutos = List.from(listaProdutos);
    buscandoProdutos = false;
  }

  @observable
  bool buscandoMaisProdutos = false;

  @observable
  bool habilitarNovaBusca = true;

  @action
  carregarMaisProdutos(BuildContext context, bool isCategoria,
      MarcaProduto marcaProduto, CategoriaProduto categoriaProduto) async {
    buscandoMaisProdutos = true;
    habilitarNovaBusca = false;
    List<Produto> produtos = [];
    if (isCategoria) {
      if (subcategorias[0].ativo)
        produtos = await produtosCategoriasRepository.listaProdutosPorCategoria(
            categoriaProduto.categoria.id, listaProdutos.length);
      else {
        List<Produto> res =
            await produtosCategoriasRepository.listaProdutosEmComum(
                categoriaProduto.categoria.id,
                categoriasIDs,
                listaProdutos.length);
        if (res != null) produtos = res;
      }
    } else {
      produtos = await produtosCategoriasRepository.listaProdutosPorMarca(
          marcaProduto.marca.id, listaProdutos.length);
    }

    if (produtos != null)
      for (var item in produtos) {
        listaProdutos.add(item);
      }
    else
      produtos = [];

    listaProdutos = List.from(listaProdutos);
    buscandoMaisProdutos = false;

    if (produtos.isEmpty) {
      final snackBar = SnackBar(
        content: Text('Não foi encontrado mais produtos'),
      );

      Scaffold.of(context).showSnackBar(snackBar);
    }

    habilitarNovaBusca = true;
  }

  @action
  buscarSubcategorias(int id) async {
    List<Subcategoria> res =
        await produtosCategoriasRepository.listaCategoriasEmComum(id);
    if (res != null) {
      subcategorias = res;
      // res.forEach((element) {
      //   subcategorias.add(element);
      // });
    }
    subcategorias.insert(
      0,
      Subcategoria(
        subcategoria_id: 0,
        nome: 'Todos',
        ativo: true,
      ),
    );
    subcategorias = List.from(subcategorias);
  }
}
