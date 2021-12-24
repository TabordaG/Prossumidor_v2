import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';

abstract class IProdutosCategoriasRepository implements Disposable {
  Future listaProdutosPorMarca(int id, int offset);
  Future listaProdutosPorCategoria(int id, int offset);
  Future listaCategoriasEmComum(int id);
  Future<List<Produto>> listaProdutosEmComum(
      int id, List<int> categoriasIDs, int offset);
}
