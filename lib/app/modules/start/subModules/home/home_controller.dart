import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/models/categoria/categoria_model.dart';
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

    setRefreshTrue();
    buscarCategorias();
  }

  final AuthController authController = Modular.get<AuthController>();
  final IHomeRepository homeRepository = Modular.get<IHomeRepository>();

  @observable
  bool refreshPage = true;

  @action
  setRefreshTrue() {
    listaCategoriaProdutos = List.from([]);
    refreshPage = true;
  }

  @observable
  List categoriasID = [];

  @observable
  ScrollController scrollController;

  @observable
  double offsetHomeList = 0.0;

  @action
  setOffsetHomeList(double valor) => offsetHomeList = valor;

  @observable
  String buscarString = '';

  @observable
  List<Categoria> listaCategorias = [];

  @observable
  List<CategoriaProduto> listaCategoriaProdutos = [];

  @action
  setBuscarString(String valor) => buscarString = valor;

  @action
  iniciarHome() {
    // carregado = false;
    String res = buscarCategorias();
    String res2 = "";
    if (res == "sucesso") res2 = buscarProdutosPorCategoriaID();
    // carregado = true;
    if (res2 == "sucesso") refreshPage = false;
    return res2;
  }

  @action
  buscarCategorias() async {
    print("Teste Lista 1 $listaCategoriaProdutos");
    // if (carregado == false ||
    //     listaCategoriaProdutos == null ||
    //     listaCategoriaProdutos.isEmpty) {
    // listaCategorias = List.from([]);
    var res = await homeRepository.listaCategorias();
    if (res != null) {
      listaCategorias = List.from(res);
      String res2 = await buscarProdutosPorCategoriaID();
      if (res2 == "sucesso") {
        print("MUDOU O REFRESH AQUI");
        refreshPage = false;
      }
      return "sucesso";
    }
    return "falhou";
    // }
  }

  @action
  buscarProdutosPorCategoriaID() async {
    print("Teste Lista 2 $listaCategoriaProdutos");
    // if (carregado == false ||
    //     listaCategoriaProdutos == null ||
    //     listaCategoriaProdutos.isEmpty) {
    int count = 0;
    // carregado = false;
    for (var categoria in listaCategorias) {
      count++;
      if (count < 8) {
        print(categoria.descricao);
        var res = await homeRepository.listaProdutosPorCategoria(categoria.id);
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
      }
    }
    print("Deu certo ?");
    return "sucesso";
  }
  // }
}
