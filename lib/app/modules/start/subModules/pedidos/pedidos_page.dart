import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/components/card_pedidos.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/pedidos/pedidosDetalhes_page.dart';
import 'pedidos_controller.dart';

class PedidosPage extends StatefulWidget {
  final String title;
  const PedidosPage({Key key, this.title = "Pedidos"}) : super(key: key);

  @override
  _PedidosPageState createState() => _PedidosPageState();
}

class _PedidosPageState extends ModularState<PedidosPage, PedidosController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.receipt_long,
                  color: Colors.white,
                ),
                SizedBox(
                  width: kDefaultPadding * .25,
                ),
                Text(widget.title),
              ],
            ),
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              unselectedLabelStyle: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.white38),
              labelStyle: Theme.of(context).textTheme.bodyText1,
              tabs: [
                Tab(text: 'Entregues'),
                Tab(text: 'Não entregues'),
              ],
            ),
          ),
          body: TabBarView(children: [
            Observer(builder: (_) {
              return ListView.builder(
                itemCount: controller.pedidosList.length,
                itemBuilder: (context, index) {
                  return CardPedidos(
                    index: index,
                    lista: controller.pedidosList,
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PedidosDetalhes(
                              pedido: pedidosListEntregues[index],
                            ))),
                  );
                },
              );
            }),
            Observer(builder: (_) {
              return ListView.builder(
                itemCount: controller.pedidosList.length,
                itemBuilder: (context, index) {
                  return CardPedidos(
                    index: index,
                    lista: controller.pedidosList,
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PedidosDetalhes(
                              pedido: pedidosListNaoEntregues[index],
                            ))),
                  );
                },
              );
            }),
          ])),
    );
  }
}
