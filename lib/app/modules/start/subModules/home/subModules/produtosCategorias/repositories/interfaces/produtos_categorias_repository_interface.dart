import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';

abstract class IProdutosCategoriasRepository implements Disposable {
  Future listaProdutosPorMarca(int id, int offset);
  Future listaProdutosPorCategoria(int id, int offset);
  Future listaCategoriasEmComum(int id);
  Future<List<Produto>> listaProdutosEmComum(
      int id, List<int> categoriasIDs, int offset);
  Future<List<Produto>> pesquisaProdutosMulticategorias(
      int id, List<int> categoriasIDs, String pesquisa, int offset);
  Future<List<Produto>> pesquisaProdutosCategoria(
      int id, String pesquisa, int offset);
  Future<List<Produto>> pesquisaProdutosEmpreendimento(
      int id, String pesquisa, int offset);
}
