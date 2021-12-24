import 'package:flutter_modular/flutter_modular.dart';

abstract class IHomeRepository implements Disposable {
  Future listaCategorias(int empresaId);
  Future listaProdutosPorCategoria(int id, int empresaId);
  Future pesquisarProduto(String texto, int offset);
  Future listaProdutosPorMarca(int id);
  Future listaMarcas(int id);
}
