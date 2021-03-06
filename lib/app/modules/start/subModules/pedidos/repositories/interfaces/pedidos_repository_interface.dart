import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/models/pedidos/pedidos_model.dart';

abstract class IPedidosRepository implements Disposable {
  // Future<List<Pedidos>> listaPedidosNaoEntregue(int id);
  // Future<List<Pedidos>> listaPedidosEntregue(int id);
  Future<List<Pedidos>> listaPedidos(int id, int status, int offset);
  Future<List> listaProdutos(int id);
  Future enviaMensagem(String mensagemVendedor, int marcaId, int usuarioID);
  Future cancelaPedido(int pedidoID, String status);
}
