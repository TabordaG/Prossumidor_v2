import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/models/categoria/categoria_model.dart';
import 'package:prossumidor_v2/app/models/marca/marca_model.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/home/repositories/interfaces/home_repository_interface.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  _HomeControllerBase() {
    scrollController = ScrollController()
      ..addListener(() {
        setOffsetHomeList(scrollController.offset);
      });
    authController.buscaUsuarioCompleto();
    // centroDistribuicao = authController.usuario.empresa_id.toString();

    // setRefreshTrue();
    // buscarCategorias();
  }

  final AuthController authController = Modular.get<AuthController>();
  final IHomeRepository homeRepository = Modular.get<IHomeRepository>();

  @observable
  bool refreshPage = true;

  @action
  setRefreshTrue() async {
    listaCategoriaProdutos = List.from([]);
    listaMarcaProdutos = List.from([]);
    refreshPage = true;
    return refreshPage;
  }

  @observable
  bool isFiltering = false;

  @observable
  List categoriasID = [];

  @observable
  List<Marca> listaMarcas = [];

  @observable
  bool marcaSelecionada = false;

  @observable
  ScrollController scrollController;

  @observable
  double offsetHomeList = 0.0;

  @action
  setOffsetHomeList(double valor) => offsetHomeList = valor;

  @observable
  TextEditingController buscarMarca = TextEditingController(text: "");

  @observable
  TextEditingController buscarCategoria = TextEditingController(text: "");

  @observable
  TextEditingController buscarString = TextEditingController(text: "");

  @action
  resetBuscarString() => buscarString = TextEditingController(text: "");

  @observable
  List<Categoria> listaCategorias = [];

  @observable
  List<Categoria> listaCategoriasFiltro = [];

  @observable
  List<CategoriaProduto> listaCategoriaProdutos = [];

  @observable
  List<MarcaProduto> listaMarcaProdutos = [];

  @observable
  List<Produto> produtosDaBusca = [];

  @observable
  bool buscandoProdutos = false;

  @observable
  bool buscandoMaisProdutos = false;

  @observable
  List<String> banner = [];

  // @action
  // setBuscarString(String valor) => buscarString = valor;

  @action
  iniciarHome() async {
    await setRefreshTrue();
    await buscarCategorias();
    await implementaBanner();
    return 'sucesso';
  }

  @action
  buscarCategorias() async {
    var res = await homeRepository
        .listaCategorias(authController.usuario.local_retirada_id);
    if (res != null) {
      listaCategorias = List.from(res);
      listaCategoriasFiltro = List.from(res);
      listaCategoriasFiltro.sort((a, b) => a.descricao.compareTo(b.descricao));
      listaCategoriasFiltro.insert(
        0,
        Categoria(
          descricao: "Todas Categorias",
          selecionado: true,
        ),
      );
      String res2 = await buscarProdutosPorCategoriaID();
      if (res2 == "sucesso") {
        refreshPage = false;
      }
      return "sucesso";
    }
    return "falhou";
  }

  @action
  buscarProdutosPorCategoriaID() async {
    marcaSelecionada = false;
    buscandoProdutos = true;
    for (var categoria in listaCategorias) {
      var res = await homeRepository.listaProdutosPorCategoria(
          categoria.id, authController.usuario.empresa_id);
      if (res != null && res.length > 0) {
        CategoriaProduto categoriaProduto = CategoriaProduto(
          categoria: categoria,
          produtos: [],
        );
        for (var produto in res) {
          categoriaProduto.produtos.add(produto);
        }
        listaCategoriaProdutos.add(categoriaProduto);
      }
      listaCategoriaProdutos = List.from(listaCategoriaProdutos);
      if (listaCategoriaProdutos.length > 3 && refreshPage) {
        refreshPage = false;
        buscandoProdutos = false;
      }
    }
    buscandoProdutos = false;

    return "sucesso";
  }

  ////////////////////////////
  // ACTIONS EMPREENDIMENTOS//
  ////////////////////////////

  @action
  buscarProdutosPorMarcas() async {
    listaMarcaProdutos = [];
    marcaSelecionada = true;
    buscandoProdutos = true;

    if (!listaMarcas[0].selecionado) {
      for (var i = 1; i < listaMarcas.length; i++) {
        if (listaMarcas[i].selecionado) {
          List<Produto> produtos =
              await homeRepository.listaProdutosPorMarca(listaMarcas[i].id);

          listaMarcaProdutos.add(
            MarcaProduto(
              marca: listaMarcas[i],
              produtos: produtos,
            ),
          );
          listaMarcaProdutos = List.from(listaMarcaProdutos);
          if (listaCategoriaProdutos.length > 3 && refreshPage) {
            refreshPage = false;
            buscandoProdutos = false;
          }
        }
      }
    } else {
      for (var i = 1; i < listaMarcas.length; i++) {
        List<Produto> produtos =
            await homeRepository.listaProdutosPorMarca(listaMarcas[i].id);

        listaMarcaProdutos.add(
          MarcaProduto(
            marca: listaMarcas[i],
            produtos: produtos,
          ),
        );
        listaMarcaProdutos = List.from(listaMarcaProdutos);
        if (listaCategoriaProdutos.length > 3 && refreshPage) {
          refreshPage = false;
          buscandoProdutos = false;
        }
      }
    }
    buscandoProdutos = false;

    return "sucesso";
  }

  @action
  atualizaListaMarca() => listaMarcas = List.from(listaMarcas);

  @computed
  List<Marca> get filtroMarca => listaMarcas.map<Marca>((e) {
        if (e.descricao.toLowerCase().contains(buscarMarca.text.toLowerCase()))
          return e;
        return null;
      }).toList();

  @action
  buscarMarcas() async {
    var res =
        await homeRepository.listaMarcas(authController.usuario.empresa_id);
    if (res != null) {
      listaMarcas = [
        Marca(
          id: 0,
          descricao: "Todos Empreendimentos",
          selecionado: false,
        )
      ];
      for (var marca in res) {
        listaMarcas.add(marca);
      }
      listaMarcas = List.from(listaMarcas);
    }
  }

  @action
  selecionarMarca(int index, bool selecionar) {
    listaMarcas[index].selecionado = selecionar;
    listaMarcas = List.from(listaMarcas);
    if (index == 0 && selecionar) {
      for (var i = 1; i < listaMarcas.length; i++) {
        listaMarcas[i].selecionado = false;
      }
    } else {
      bool varredura = false;
      for (var i = 1; i < listaMarcas.length; i++) {
        if (listaMarcas[i].selecionado) varredura = true;
      }
      if (varredura) {
        listaMarcas[0].selecionado = false;
      } else {
        listaMarcas[0].selecionado = true;
      }
    }
    listaCategoriasFiltro.forEach((element) {
      element.selecionado = false;
    });
    listaMarcas = List.from(listaMarcas);
    listaCategoriasFiltro = List.from(listaCategoriasFiltro);
  }

  @action
  confirmarMarcaCategoria(int index) async {
    isFiltering = true;
    bool varredura = false;
    if (index == 0) {
      for (var i = 0; i < listaCategoriasFiltro.length; i++) {
        if (listaCategoriasFiltro[i].selecionado) {
          varredura = true;
        }
        int j = listaCategoriaProdutos.indexWhere(
            (element2) => listaCategoriasFiltro[i].id == element2.categoria.id);
        if (j != -1)
          listaCategoriaProdutos[j].categoria.selecionado =
              listaCategoriasFiltro[i].selecionado;
      }
      if (varredura) {
        // await setRefreshTrue();
        refreshPage = true;

        Future.delayed(Duration(seconds: 2), () {
          refreshPage = false;
        });
        // await buscarCategorias();
        marcaSelecionada = false;
      }
    } else {
      for (var i = 0; i < listaMarcas.length; i++) {
        if (listaMarcas[i].selecionado) varredura = true;
      }
      if (varredura) {
        // await setRefreshTrue();
        refreshPage = true;
        await buscarProdutosPorMarcas();
        marcaSelecionada = true;
      }
    }
    if (listaCategoriasFiltro[0].selecionado || listaMarcas[0].selecionado)
      isFiltering = false;
    refreshPage = false;
  }

  @action
  resetarMarcasCategoria(int index) {
    listaMarcas[0].selecionado = true;
    for (var i = 1; i < listaMarcas.length; i++) {
      listaMarcas[i].selecionado = false;
    }

    if (listaCategoriaProdutos.isEmpty) {
      setRefreshTrue();
      buscarCategorias();
    }
  }

  ////////////////////////////
  //   ACTIONS CATEGORIAS   //
  ////////////////////////////

  @action
  selecionarCategoria(int index, bool selecionar) {
    listaCategoriasFiltro[index].selecionado = selecionar;
    listaCategoriasFiltro = List.from(listaCategoriasFiltro);
    if (index == 0 && selecionar) {
      for (var i = 1; i < listaCategoriasFiltro.length; i++) {
        listaCategoriasFiltro[i].selecionado = false;
      }
    } else {
      bool varredura = false;
      for (var i = 1; i < listaCategoriasFiltro.length; i++) {
        if (listaCategoriasFiltro[i].selecionado) varredura = true;
      }
      if (varredura) {
        listaCategoriasFiltro[0].selecionado = false;
      } else {
        listaCategoriasFiltro[0].selecionado = true;
      }
    }
    listaMarcas.forEach((element) {
      element.selecionado = false;
    });
    listaCategoriasFiltro = List.from(listaCategoriasFiltro);
    listaMarcas = List.from(listaMarcas);
  }

  @action
  atualizaListaCategoria() =>
      listaCategoriasFiltro = List.from(listaCategoriasFiltro);

  @computed
  List<Categoria> get filtroCategoria =>
      listaCategoriasFiltro.map<Categoria>((e) {
        if (e.descricao
            .toLowerCase()
            .contains(buscarCategoria.text.toLowerCase())) return e;
        return null;
      }).toList();

  @action
  pesquisarProduto() async {
    buscandoProdutos = true;
    produtosDaBusca = [];
    List<Produto> produtos = await homeRepository.pesquisarProduto(
        buscarString.text, produtosDaBusca.length);
    if (produtos != null) {
      for (var item in produtos) {
        produtosDaBusca.add(item);
      }
      produtosDaBusca = List.from(produtosDaBusca);
    }
    buscandoProdutos = false;
  }

  @action
  pesquisarMaisProdutos() async {
    buscandoMaisProdutos = true;
    List<Produto> produtos = await homeRepository.pesquisarProduto(
        buscarString.text, produtosDaBusca.length);
    if (produtos != null) {
      for (var item in produtos) {
        produtosDaBusca.add(item);
      }
      produtosDaBusca = List.from(produtosDaBusca);
    } else
      produtos = [];
    buscandoMaisProdutos = false;
    return produtos;
  }

  @action
  implementaBanner() async {
    banner = [];
    banner = List.from(await homeRepository.buscaBanner());
  }
}
