import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/components/card_pedidos.dart';
import 'package:prossumidor_v2/app/constants.dart';
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
            RefreshIndicator(
              displacement: 60.0,
              color: Theme.of(context).primaryColor,
              onRefresh: () => controller.chamarListaEntregue(),
              child: Observer(builder: (_) {
                if (controller.pedidosEntregueList == null)
                  return Container(
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) =>
                              ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: constraints.maxHeight * .45),
                            child: Text(
                              "Carregando Pedidos..",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color
                                        .withOpacity(.7),
                                    fontSize: 14,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                if (controller.pedidosEntregueList.isEmpty)
                  return Container(
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) =>
                              ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: constraints.maxHeight * .45),
                            child: Text(
                              "Não há pedidos\nentregues ainda..",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color
                                        .withOpacity(.7),
                                    fontSize: 14,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                return ListView.builder(
                  itemCount: controller.pedidosEntregueList.length,
                  itemBuilder: (context, index) {
                    return CardPedidos(
                      index: index,
                      lista: controller.pedidosEntregueList,
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          'detalhes',
                          arguments: {
                            "pedido": controller.pedidosEntregueList[index],
                          },
                        );
                      },
                    );
                  },
                );
              }),
            ),
            RefreshIndicator(
              displacement: 60.0,
              color: Theme.of(context).primaryColor,
              onRefresh: () => controller.chamarListaNaoEntregue(),
              child: Observer(builder: (_) {
                if (controller.pedidosNaoEntregueList == null)
                  return Container(
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) =>
                              ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: constraints.maxHeight * .45),
                            child: Text(
                              "Carregando Pedidos..",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color
                                        .withOpacity(.7),
                                    fontSize: 14,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                if (controller.pedidosNaoEntregueList.isEmpty)
                  return LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) =>
                            ListView(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: constraints.maxHeight * .45),
                          child: Text(
                            "Não há pedidos\nentregues ainda..",
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .color
                                          .withOpacity(.7),
                                      fontSize: 14,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  );
                return ListView.builder(
                  itemCount: controller.pedidosNaoEntregueList.length,
                  itemBuilder: (context, index) {
                    return CardPedidos(
                      index: index,
                      lista: controller.pedidosNaoEntregueList,
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          'detalhes',
                          arguments: {
                            "pedido": controller.pedidosNaoEntregueList[index],
                          },
                        );
                      },
                    );
                  },
                );
              }),
            ),
          ])),
    );
  }
}
