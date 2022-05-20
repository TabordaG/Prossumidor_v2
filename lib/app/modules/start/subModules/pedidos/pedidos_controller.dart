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
    pedidosEntregueList = List.from(await pedidosRepository.listaPedidos(
        authController.usuario.id, 0, pedidosEntregueList.length));
  }

  @action
  chamarMaisListaEntregue(BuildContext context, SnackBar snackBar) async {
    List<Pedidos> list = await pedidosRepository.listaPedidos(
        authController.usuario.id, 0, pedidosEntregueList.length);
    for (var element in list) {
      pedidosEntregueList.add(element);
    }
    pedidosEntregueList = List.from(pedidosEntregueList);
    if (list == null || list.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @action
  chamarListaEmAndamento() async {
    pedidosEmAndamento = [];
    pedidosEmAndamento = List.from(await pedidosRepository.listaPedidos(
        authController.usuario.id, 1, pedidosEmAndamento.length));
  }

  @action
  chamarMaisListaEmAndamento(BuildContext context, SnackBar snackBar) async {
    List<Pedidos> list = await pedidosRepository.listaPedidos(
        authController.usuario.id, 1, pedidosEmAndamento.length);
    for (var element in list) {
      pedidosEmAndamento.add(element);
    }

    pedidosEmAndamento = List.from(pedidosEmAndamento);
    if (list == null || list.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @action
  chamarListaNaoEntregueCancelado() async {
    pedidosNaoEntregueList = [];
    pedidosNaoEntregueList = List.from(await pedidosRepository.listaPedidos(
        authController.usuario.id, 2, pedidosNaoEntregueList.length));
  }

  @action
  chamarMaisListaNaoEntregueCancelado(
      BuildContext context, SnackBar snackBar) async {
    List<Pedidos> list = await pedidosRepository.listaPedidos(
        authController.usuario.id, 2, pedidosNaoEntregueList.length);
    for (var element in list) {
      pedidosNaoEntregueList.add(element);
    }
    pedidosNaoEntregueList = List.from(pedidosNaoEntregueList);
    if (list == null || list.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
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
