import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/models/pedidos/pedidos_model.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/pedidos/repositories/interfaces/pedidos_repository_interface.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';

part 'pedidos_controller.g.dart';

@Injectable()
class PedidosController = _PedidosControllerBase with _$PedidosController;

abstract class _PedidosControllerBase with Store {
  final AuthController authController = Modular.get<AuthController>();
  final IPedidosRepository pedidosRepository =
      Modular.get<IPedidosRepository>();
  _PedidosControllerBase() {
    chamarListaEntregue();
    chamarListaEmAndamento();
    chamarListaNaoEntregueCancelado();
  }

  @observable
  TextEditingController mensagemVendedor = TextEditingController();

  @observable
  List<Pedidos> pedidosNaoEntregueList = [];

  @observable
  List<Pedidos> pedidosEntregueList = [];

  @observable
  List<Pedidos> pedidosEmAndamento = [];

  @observable
  List<Produto> produtosList = [];

  @action
  chamarListaEntregue() async {
    pedidosEntregueList = [];
    // pedidosEntregueList = List.from(await pedidosRepository
    //     .listaPedidosEntregue(authController.usuario.id));
    pedidosEntregueList = List.from(
        await pedidosRepository.listaPedidos(authController.usuario.id, 0));
  }

  @action
  chamarListaEmAndamento() async {
    pedidosEmAndamento = [];
    // pedidosEntregueList = List.from(await pedidosRepository
    //     .listaPedidosEntregue(authController.usuario.id));
    pedidosEmAndamento = List.from(
        await pedidosRepository.listaPedidos(authController.usuario.id, 1));
  }

  @action
  chamarListaNaoEntregueCancelado() async {
    pedidosNaoEntregueList = [];
    // pedidosNaoEntregueList = List.from(await pedidosRepository
    //     .listaPedidosNaoEntregue(authController.usuario.id));
    pedidosNaoEntregueList = List.from(
        await pedidosRepository.listaPedidos(authController.usuario.id, 2));
  }

  @action
  buscarProdutos(int id) async {
    produtosList = [];
    produtosList = List.from(await pedidosRepository.listaProdutos(id));
    produtosList = List.from(produtosList);
  }

  @action
  enviaMensagem(String mensagemVendedor, int marcaId, int usuarioID) async {
    var res = await pedidosRepository.enviaMensagem(
        mensagemVendedor, marcaId, usuarioID);
    return res;
  }

  @action
  cancelaPedido(int pedidoID, String status) async {
    var res = await pedidosRepository.cancelaPedido(pedidoID, status);

    return res;
  }
}
