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
    centroDistribuicao = authController.usuario.empresa_id.toString();
  }

  final AuthController authController = Modular.get<AuthController>();
  final IHomeRepository homeRepository = Modular.get<IHomeRepository>();

  @observable
  String centroDistribuicao;

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
  buscarCategorias() async {
    var res = await homeRepository.listaCategorias();
    if (res != null) {
      listaCategorias = List.from(res);
      print("Teste");
    }
  }

  @action
  buscarProdutosPorCategoriaID() async {
    int count = 0;
    listaCategoriaProdutos = [];
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
  }
}
