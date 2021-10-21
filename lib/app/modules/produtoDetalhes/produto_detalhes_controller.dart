import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';
import 'package:prossumidor_v2/app/modules/produtoDetalhes/repositories/interfaces/produto_detalhes_repository_interface.dart';

part 'produto_detalhes_controller.g.dart';

@Injectable()
class ProdutoDetalhesController = _ProdutoDetalhesControllerBase
    with _$ProdutoDetalhesController;

abstract class _ProdutoDetalhesControllerBase with Store {
  final IProdutoDetalhesRepository produtoDetalhesRepository =
      Modular.get<IProdutoDetalhesRepository>();

  @observable
  Produto produto;

  @action
  setProduto(Produto produtoReceived) async {
    produto = produtoReceived;
    produto = await produtoDetalhesRepository.buscarProduto(produto.id);
    produto.marca = produtoReceived.marca;

    Produto aux = produto;
    produto = Produto();
    produto = aux;
    print(produto.id);
  }

  @observable
  int value = 1;

  @action
  void increment(int limite) {
    if (value < limite) value++;
  }

  @action
  void decrement() {
    if (value > 0) value--;
  }
}
