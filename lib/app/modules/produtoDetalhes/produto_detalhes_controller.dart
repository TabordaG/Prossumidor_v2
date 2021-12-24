import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';
import 'package:prossumidor_v2/app/modules/produtoDetalhes/repositories/interfaces/produto_detalhes_repository_interface.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';

part 'produto_detalhes_controller.g.dart';

@Injectable()
class ProdutoDetalhesController = _ProdutoDetalhesControllerBase
    with _$ProdutoDetalhesController;

abstract class _ProdutoDetalhesControllerBase with Store {
  final IProdutoDetalhesRepository produtoDetalhesRepository =
      Modular.get<IProdutoDetalhesRepository>();
  final AuthController authController = Modular.get<AuthController>();

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
  void increment() {
    if (value < double.parse(produto.estoque_atual)) value++;
  }

  @action
  void decrement() {
    if (value > 1) value--;
  }

  @observable
  bool adicionandoSacola = false;

  @observable
  bool adicionado = false;

  @observable
  String adicionarMensagem = "";

  @action
  adicionarSacola(BuildContext context) async {
    adicionandoSacola = true;
    var verifica = await produtoDetalhesRepository.procurarProdutoCarrinho(
        produto.id, authController.usuario.id);
    if (verifica != null) {
      print(verifica);
      var res = await produtoDetalhesRepository.incrementaQuantidadeCarrinho(
          value, verifica);
      if (res != null)
        adicionarMensagem = "Produto adicionado com sucesso";
      else
        adicionarMensagem = "Erro ao adicionar produto";
    } else {
      var res = await produtoDetalhesRepository.inserirProdutoCarrinho(
        produto.id,
        value,
        authController.usuario.empresa_id,
        double.parse(produto.preco_venda),
        authController.usuario.id,
      );
      if (res != null) {
        adicionarMensagem = "Produto adicionado com sucesso";
        adicionado = true;
      } else
        adicionarMensagem = "Erro ao adicionar produto";
    }
    await Future.delayed(Duration(seconds: 1), () {
      adicionandoSacola = false;
    });

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }
}
