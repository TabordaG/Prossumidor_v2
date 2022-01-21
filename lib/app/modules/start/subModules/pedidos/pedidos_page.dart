import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/components/card_pedidos.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'pedidos_controller.dart';

class PedidosPage extends StatefulWidget {
  final String title;
  const PedidosPage({this.title = "Pedidos"}) : super();

  @override
  _PedidosPageState createState() => _PedidosPageState();
}

class _PedidosPageState extends ModularState<PedidosPage, PedidosController>
    with TickerProviderStateMixin {
  ScrollController scrollController1;
  ScrollController scrollController2;
  ScrollController scrollController3;
  TabController tabController;

  scrollListener() async {
    if (tabController.index == 0) {
      if (scrollController1.position.pixels ==
          scrollController1.position.maxScrollExtent) {
        controller.chamarMaisListaEmAndamento(context, snackBar1);
        Scaffold.of(context).showSnackBar(snackBar);
      }
    }
    if (tabController.index == 1) {
      if (scrollController2.position.pixels ==
          scrollController2.position.maxScrollExtent) {
        controller.chamarMaisListaEntregue(context, snackBar1);
        Scaffold.of(context).showSnackBar(snackBar);
      }
    }
    if (tabController.index == 2) {
      if (scrollController3.position.pixels ==
          scrollController3.position.maxScrollExtent) {
        controller.chamarMaisListaNaoEntregueCancelado(context, snackBar1);
        Scaffold.of(context).showSnackBar(snackBar);
      }
    }
  }

  final snackBar = SnackBar(
    content: const Text('Carregando mais pedidos...'),
    duration: Duration(milliseconds: 500),
  );

  final snackBar1 = SnackBar(
    content: const Text('Nao há mais pedidos!'),
    duration: Duration(milliseconds: 1000),
  );

  @override
  void initState() {
    tabController = TabController(length: 3, initialIndex: 0, vsync: this);
    scrollController1 = ScrollController();
    scrollController2 = ScrollController();
    scrollController3 = ScrollController();
    scrollController1.addListener(scrollListener);
    scrollController2.addListener(scrollListener);
    scrollController3.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    scrollController1.dispose();
    scrollController2.dispose();
    scrollController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
              controller: tabController,
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              unselectedLabelStyle: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.white38),
              labelStyle: Theme.of(context).textTheme.bodyText1,
              tabs: [
                Tab(text: 'Andamento'),
                Tab(text: 'Entregues'),
                Tab(text: 'Cancelados'),
              ],
            ),
          ),
          body: TabBarView(
              controller: tabController,
              physics: BouncingScrollPhysics(),
              children: [
                RefreshIndicator(
                  displacement: 60.0,
                  color: Theme.of(context).primaryColor,
                  onRefresh: () => controller.chamarListaEmAndamento(),
                  child: Observer(builder: (_) {
                    if (controller.pedidosEntregueList == null)
                      return Container(
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                                  BoxConstraints constraints) =>
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
                    if (controller.pedidosEmAndamento.isEmpty)
                      return Container(
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                                  BoxConstraints constraints) =>
                              ListView(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: constraints.maxHeight * .45),
                                child: Text(
                                  "Não há pedidos\nem andamento ainda..",
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
                    return Scrollbar(
                      controller: scrollController1,
                      radius: Radius.circular(12),
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        controller: scrollController1,
                        itemCount: controller.pedidosEmAndamento.length,
                        itemBuilder: (context, index) {
                          return CardPedidos(
                            index: index,
                            lista: controller.pedidosEmAndamento,
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                'detalhes',
                                arguments: {
                                  "pedido":
                                      controller.pedidosEmAndamento[index],
                                },
                              );
                            },
                          );
                        },
                      ),
                    );
                  }),
                ),
                RefreshIndicator(
                  displacement: 60.0,
                  color: Theme.of(context).primaryColor,
                  onRefresh: () => controller.chamarListaEntregue(),
                  child: Observer(builder: (_) {
                    if (controller.pedidosEntregueList == null)
                      return Container(
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                                  BoxConstraints constraints) =>
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
                      return LayoutBuilder(
                        builder: (BuildContext context,
                                BoxConstraints constraints) =>
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
                      );
                    return Scrollbar(
                      controller: scrollController1,
                      radius: Radius.circular(12),
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        controller: scrollController2,
                        itemCount: controller.pedidosEntregueList.length,
                        itemBuilder: (context, index) {
                          return CardPedidos(
                            index: index,
                            lista: controller.pedidosEntregueList,
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                'detalhes',
                                arguments: {
                                  "pedido":
                                      controller.pedidosEntregueList[index],
                                },
                              );
                            },
                          );
                        },
                      ),
                    );
                  }),
                ),
                RefreshIndicator(
                  displacement: 60.0,
                  color: Theme.of(context).primaryColor,
                  onRefresh: () => controller.chamarListaNaoEntregueCancelado(),
                  child: Observer(builder: (_) {
                    if (controller.pedidosNaoEntregueList == null)
                      return Container(
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                                  BoxConstraints constraints) =>
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
                        builder: (BuildContext context,
                                BoxConstraints constraints) =>
                            ListView(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: constraints.maxHeight * .45),
                              child: Text(
                                "Não há pedidos\nnão entregues ainda..",
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
                      );
                    return Scrollbar(
                      controller: scrollController1,
                      radius: Radius.circular(12),
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        controller: scrollController3,
                        itemCount: controller.pedidosNaoEntregueList.length,
                        itemBuilder: (context, index) {
                          return CardPedidos(
                            index: index,
                            lista: controller.pedidosNaoEntregueList,
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                'detalhes',
                                arguments: {
                                  "pedido":
                                      controller.pedidosNaoEntregueList[index],
                                },
                              );
                            },
                          );
                        },
                      ),
                    );
                  }),
                ),
              ])),
    );
  }
}
