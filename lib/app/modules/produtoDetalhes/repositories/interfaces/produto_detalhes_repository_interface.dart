import 'package:flutter_modular/flutter_modular.dart';

abstract class IProdutoDetalhesRepository implements Disposable {
  Future buscarProduto(int id);
  Future inserirProdutoCarrinho(int idProduto, int quantidade, int empresaId,
      double preco, int usuarioId);
  Future procurarProdutoCarrinho(int produtoId, int clienteId);
  Future incrementaQuantidadeCarrinho(int quantidade, int carrinhoId);
}
