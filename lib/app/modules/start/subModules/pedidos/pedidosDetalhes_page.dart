import 'package:flutter/material.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/models/pedidos/pedidos_model.dart';

class PedidosDetalhes extends StatefulWidget {
  final Pedidos pedido;
  const PedidosDetalhes({Key key, this.pedido}) : super(key: key);

  @override
  _PedidosDetalhesState createState() => _PedidosDetalhesState();
}

class _PedidosDetalhesState extends State<PedidosDetalhes> {
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
                      Text("Total de itens:"),
                      Text(
                        "${pedido.produtos.length.toString()}",
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
                  )
                ],
              ),
              Divider(),
              Expanded(
                  child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: pedido.produtos.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      right: kDefaultPadding * .1,
                      bottom: kDefaultPadding * .3,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          child: Container(
                            height: 90,
                            width: 90,
                            child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                pedido.produtos[index].produto.imagem,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: kDefaultPadding * .5,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                pedido.produtos[index].produto.nome,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      fontSize: 16,
                                    ),
                              ),
                              Text(
                                produtoList[index].produtor,
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
                                          .withOpacity(.8),
                                    ),
                              ),
                              Text(
                                "Quantidade:\n" +
                                    pedido.produtos[index].quantidade
                                        .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
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
                                      pedido.produtos[index].produto.preco
                                          .toStringAsFixed(2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )),
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
                          Row(
                            children: [
                              Text("Situação: "),
                              Text(
                                pedido.status_pedido,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Data: "),
                              Text(
                                pedido.data_registro,
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
                      SizedBox(height: kDefaultPadding * 0.25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Pagamento"),
                          Text(
                            pedido.pagamento,
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Entrega"),
                          Text(
                            pedido.tipo_entrega,
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
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
                          Text("Frete: "),
                          Text(
                            "R\$ " +
                                pedido.observacoes_entrega
                                    .toString()
                                    .replaceAll(".", ","),
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
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
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                          Text(
                            "R\$ " +
                                pedido.valor_total
                                    .toString()
                                    .replaceAll(".", ","),
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
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
        ));
  }
}
