import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/models/pedidos/pedidos_model.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/pedidos/pedidos_controller.dart';

import '../../../../dados_basicos.dart';

class PedidosDetalhes extends StatefulWidget {
  final Pedidos pedido;
  final Produto produto;
  const PedidosDetalhes({ this.pedido, this.produto}) : super();

  @override
  _PedidosDetalhesState createState() => _PedidosDetalhesState();
}

class _PedidosDetalhesState extends State<PedidosDetalhes> {
  final PedidosController controller = Modular.get<PedidosController>();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    controller.buscarProdutos(widget.pedido.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pedido = widget.pedido;
    return Scaffold(
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
            Text("Meus Pedidos"),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(kDefaultPadding * 0.75),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("Pedido: #"),
                    Text(
                      "${pedido.id.toString()}",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 14,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .color
                              .withOpacity(1),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Total de itens: "),
                    Observer(builder: (_) {
                      return Text(
                        controller.produtosList != null
                            ? "${controller.produtosList.length}"
                            : "Carregando..",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 14,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .color
                                .withOpacity(1),
                            fontWeight: FontWeight.w600),
                      );
                    }),
                  ],
                )
              ],
            ),
            Divider(),
            Expanded(child: Observer(builder: (_) {
              if (controller.produtosList == null ||
                  controller.produtosList.length == 0)
                return Center(
                  child: CircularProgressIndicator(),
                );
              return Scrollbar(
                controller: scrollController,
                radius: Radius.circular(10),
                thickness: 3,
                isAlwaysShown: true,
                child: ListView.builder(
                  controller: scrollController,
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.produtosList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: kDefaultPadding * .5),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          child: controller.produtosList[index].imagem !=
                                      null &&
                                  controller.produtosList[index].imagem != ""
                              ? CachedNetworkImage(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  imageUrl: "${Basicos.ip2}/media/" +
                                      controller.produtosList[index].imagem,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Padding(
                                    padding: EdgeInsets.all(25.0),
                                    child: CircularProgressIndicator(
                                      strokeWidth: 1,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                )
                              : Center(
                                  child: Icon(Icons.error),
                                ),

                          // CachedNetworkImage(
                          //   imageUrl: "${Basicos.ip2}/media/" +
                          //       controller.produtosList[index].imagem,
                          // ),
                          // child: Image.network(
                          //   Basicos.ip + '/media/' + produtoList[index].imagem,
                          //   fit: BoxFit.contain,
                          //   height: 90,
                          //   width: 90,
                          //   loadingBuilder: (context, child, loadingProgress) =>
                          //       Center(
                          //     child: Padding(
                          //       padding: EdgeInsets.fromLTRB(15, 8, 8, 8),
                          //       child: CircularProgressIndicator(
                          //         strokeWidth: 2,
                          //       ),
                          //     ),
                          //   ),
                          // errorBuilder: (context, error, stackTrace) => Image(
                          //   image: AssetImage("assets/images/sem-imagem.png"),
                          // ),
                          // ),
                        ),
                        title: Text(
                          controller.produtosList[index].descricao_simplificada,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                fontSize: 14,
                              ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.produtosList[index].descricao
                                  .toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color
                                        .withOpacity(.7),
                                  ),
                            ),
                            Text(
                              "Quantidade: " +
                                  double.parse(controller
                                          .produtosList[index].quantidade)
                                      .toStringAsFixed(0),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        trailing: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      fontSize: 12,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .color
                                          .withOpacity(.8),
                                    ),
                            children: [
                              TextSpan(text: 'Valor Unit.'),
                              TextSpan(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      fontSize: 11,
                                    ),
                                text: '\nR\$ ' +
                                    double.parse(controller
                                            .produtosList[index].preco_venda)
                                        .toStringAsFixed(2)
                                        .replaceAll(".", ","),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );

                    // return Container(
                    //   height: 100,
                    //   width: double.infinity,
                    //   margin: EdgeInsets.only(
                    //     right: kDefaultPadding * .1,
                    //     bottom: kDefaultPadding * .3,
                    //   ),
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       ClipRRect(
                    //         borderRadius: BorderRadius.all(
                    //           Radius.circular(5),
                    //         ),
                    //         child: Image(
                    //           image: AssetImage("assets/images/sem-imagem.png"),
                    //         ),
                    //         // child: Image.network(
                    //         //   Basicos.ip + '/media/' + produtoList[index].imagem,
                    //         //   fit: BoxFit.contain,
                    //         //   height: 90,
                    //         //   width: 90,
                    //         //   loadingBuilder: (context, child, loadingProgress) =>
                    //         //       Center(
                    //         //     child: Padding(
                    //         //       padding: EdgeInsets.fromLTRB(15, 8, 8, 8),
                    //         //       child: CircularProgressIndicator(
                    //         //         strokeWidth: 2,
                    //         //       ),
                    //         //     ),
                    //         //   ),
                    //         // errorBuilder: (context, error, stackTrace) => Image(
                    //         //   image: AssetImage("assets/images/sem-imagem.png"),
                    //         // ),
                    //         // ),
                    //       ),
                    //       SizedBox(
                    //         width: kDefaultPadding * .5,
                    //       ),
                    //       Expanded(
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Text(
                    //               controller.produtosList[index].nome,
                    //               softWrap: true,
                    //               overflow: TextOverflow.ellipsis,
                    //               maxLines: 2,
                    //               style: Theme.of(context)
                    //                   .textTheme
                    //                   .bodyText1
                    //                   .copyWith(
                    //                     fontSize: 16,
                    //                   ),
                    //             ),
                    //             Text(
                    //               produtoList[index].produtor,
                    //               maxLines: 2,
                    //               overflow: TextOverflow.ellipsis,
                    //               style: Theme.of(context)
                    //                   .textTheme
                    //                   .bodyText1
                    //                   .copyWith(
                    //                     fontSize: 12,
                    //                     color: Theme.of(context)
                    //                         .textTheme
                    //                         .bodyText1
                    //                         .color
                    //                         .withOpacity(.8),
                    //                   ),
                    //             ),
                    //             Text(
                    //               "Quantidade:\n" +
                    //                   controller.produtosList[index].quantidade
                    //                       .toString(),
                    //               style: Theme.of(context)
                    //                   .textTheme
                    //                   .bodyText1
                    //                   .copyWith(
                    //                     fontSize: 14,
                    //                     fontWeight: FontWeight.w500,
                    //                   ),
                    //               textAlign: TextAlign.center,
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       Center(
                    //         child: RichText(
                    //           textAlign: TextAlign.center,
                    //           text: TextSpan(
                    //             style: Theme.of(context)
                    //                 .textTheme
                    //                 .bodyText1
                    //                 .copyWith(
                    //                   fontSize: 12,
                    //                   color: Theme.of(context)
                    //                       .textTheme
                    //                       .bodyText1
                    //                       .color
                    //                       .withOpacity(.8),
                    //                 ),
                    //             children: [
                    //               TextSpan(text: 'Valor Unit.'),
                    //               TextSpan(
                    //                 style: Theme.of(context)
                    //                     .textTheme
                    //                     .bodyText1
                    //                     .copyWith(
                    //                       fontSize: 11,
                    //                     ),
                    //                 text: '\nR\$ ' +
                    //                     double.parse(controller
                    //                             .produtosList[index].preco)
                    //                         .toStringAsFixed(2),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // );
                  },
                ),
              );
            })),
            Divider(),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding * 0.5,
                    horizontal: kDefaultPadding * 0.5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Situação: "),
                        Flexible(
                          child: Text(
                            pedido.status_pedido,
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Data"),
                            Text(
                              "${pedido.data_registro.day}/${pedido.data_registro.month}/${pedido.data_registro.year}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // SizedBox(height: kDefaultPadding * 0.25),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text("Pagamento"),
                    //     Text(
                    //       pedido.pagamento != null
                    //           ? pedido.pagamento
                    //           : "null",
                    //       style:
                    //           Theme.of(context).textTheme.bodyText1.copyWith(
                    //                 fontSize: 14,
                    //                 fontWeight: FontWeight.w700,
                    //               ),
                    //     ),
                    //   ],
                    // ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Entrega"),
                        Text(
                          widget.pedido.observacoes_entrega.startsWith('0')
                              ? 'Retirado no local'
                              : 'Entrega em domicílio',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ],
                    ),
                    SizedBox(height: kDefaultPadding * 0.25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Frete"),
                        Text(
                          "R\$ " +
                              pedido.observacoes_entrega
                                  .toString()
                                  .replaceAll(".", ",")
                                  .replaceAll(" ", ""),
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        Text(
                          "R\$ " +
                              (double.parse(pedido.valor_total) +
                                      double.parse(pedido.observacoes_entrega))
                                  .toStringAsFixed(2)
                                  .replaceAll(".", ","),
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
