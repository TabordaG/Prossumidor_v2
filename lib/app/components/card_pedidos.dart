import 'package:flutter/material.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/models/pedidos/pedidos_model.dart';

class CardPedidos extends StatefulWidget {
  final int index;
  final List<Pedidos> lista;
  final Function onTap;

  const CardPedidos({
    Key key,
    this.index,
    this.lista,
    this.onTap,
  }) : super(key: key);

  @override
  _CardPedidosState createState() => _CardPedidosState();
}

class _CardPedidosState extends State<CardPedidos> {
  @override
  Widget build(BuildContext context) {
    bool isCancel;
    if (widget.lista[widget.index].situacao.toUpperCase() == 'CANCELADO') {
      isCancel = true;
    } else if (widget.lista[widget.index].situacao.toUpperCase() ==
        'ENTREGUE') {
      isCancel = true;
    } else
      isCancel = false;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 0.5,
        vertical: kDefaultPadding * 0.25,
      ),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Card(
          color: Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: kDefaultPadding * 0.25,
                horizontal: kDefaultPadding * 0.5),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: kDefaultPadding * 0.5,
                      bottom: kDefaultPadding * 0.125),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('Pedido: '),
                          Text(
                            '${widget.lista[widget.index].pedidos_id}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color
                                        .withOpacity(1),
                                    fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text("Itens: "),
                          Text(
                            "${widget.lista[widget.index].itens}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontSize: 14,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color
                                        .withOpacity(1),
                                    fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: kDefaultPadding * 0.125),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('Fornecedor:'),
                          Text(
                            ' ${widget.lista[widget.index].fornecedor}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color
                                        .withOpacity(1),
                                    fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Data: "),
                          Text(
                            "${widget.lista[widget.index].data}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color
                                        .withOpacity(1),
                                    fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: kDefaultPadding * 0.5,
                      bottom: kDefaultPadding * 0.125),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${widget.lista[widget.index].tipo_entrega}',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 12,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .color
                                .withOpacity(1),
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          Text(
                            "Frete: ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontSize: 14,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color
                                        .withOpacity(1),
                                    fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'R\$' +
                                widget.lista[widget.index].frete
                                    .toStringAsFixed(2)
                                    .replaceAll('.', ','),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: kDefaultPadding * 0.125),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('Situação: '),
                          Text(
                            "${widget.lista[widget.index].situacao}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color
                                        .withOpacity(1),
                                    fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Total: ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color
                                        .withOpacity(1),
                                    fontWeight: FontWeight.w700),
                          ),
                          Text(
                            " R\$" +
                                widget.lista[widget.index].total
                                    .toStringAsFixed(2)
                                    .replaceAll('.', ','),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          //horizontal: kDefaultPadding * 2,
                          vertical: kDefaultPadding * 0.1),
                      child: ButtonTheme(
                          minWidth: 150,
                          height: 30,
                          child: RaisedButton(
                            onPressed: () {},
                            color: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              "Falar com o vendedor",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          //horizontal: kDefaultPadding * 2,
                          vertical: kDefaultPadding * 0.1),
                      child: ButtonTheme(
                          minWidth: 100,
                          height: 30,
                          child: RaisedButton(
                            onPressed: isCancel ? () {} : () {},
                            color: isCancel
                                ? Colors.grey
                                : Theme.of(context).colorScheme.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              "Cancelar",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
