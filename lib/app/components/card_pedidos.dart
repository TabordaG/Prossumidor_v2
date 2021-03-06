import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/models/pedidos/pedidos_model.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/pedidos/pedidos_controller.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';

class CardPedidos extends StatefulWidget {
  final int index;
  final List<Pedidos> lista;
  final Function onTap;

  const CardPedidos({
    Key? key,
    required this.index,
    required this.lista,
    required this.onTap,
  }) : super(key: key);

  @override
  _CardPedidosState createState() => _CardPedidosState();
}

class _CardPedidosState extends State<CardPedidos> {
  final PedidosController pedidosController = Modular.get<PedidosController>();
  final AuthController authController = Modular.get<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 0.25,
      ),
      child: GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: Card(
          color: Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: kDefaultPadding * 0.25,
                horizontal: kDefaultPadding * 0.5),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: kDefaultPadding * 0.5,
                      bottom: kDefaultPadding * 0.125),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text('Pedido: '),
                          Text(
                            '${widget.lista[widget.index].id}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color!
                                        .withOpacity(1),
                                    fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Itens: "),
                          Text(
                            widget.lista[widget.index].quantidade!
                                .replaceAll('.000', ''),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 14,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color!
                                        .withOpacity(1),
                                    fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: kDefaultPadding * 0.125),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            const Text('Fornecedor:'),
                            Flexible(
                              child: Text(
                                ' ${widget.lista[widget.index].empresa}',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 12,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color!
                                            .withOpacity(1),
                                        fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Text("Data: "),
                          Text(
                            "${widget.lista[widget.index].data_registro!.day}/${widget.lista[widget.index].data_registro!.month}/${widget.lista[widget.index].data_registro!.year}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color!
                                        .withOpacity(1),
                                    fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: kDefaultPadding * 0.5,
                      bottom: kDefaultPadding * 0.125),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          widget.lista[widget.index].observacoes_entrega!
                                  .startsWith('0')
                              ? 'Retirado no local'
                              : 'Entrega em domic??lio',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color!
                                      .withOpacity(1),
                                  fontWeight: FontWeight.w600),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Frete: ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 14,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color!
                                        .withOpacity(1),
                                    fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'R\$' +
                                widget.lista[widget.index].observacoes_entrega
                                    .toString()
                                    .replaceAll('.', ',')
                                    .replaceAll(' ', ''),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: kDefaultPadding * 0.125),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Situa????o: '),
                      Flexible(
                        child: Text(
                          widget.lista[widget.index].status_pedido!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color!
                                      .withOpacity(1),
                                  fontWeight: FontWeight.w700),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "Total: ",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 12,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .color!
                                .withOpacity(1),
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        " R\$" +
                            widget.lista[widget.index].valor_total
                                .toString()
                                .replaceAll('.', ','),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          //horizontal: kDefaultPadding * 2,
                          vertical: kDefaultPadding * 0.1),
                      child: ButtonTheme(
                          minWidth: 150,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                // user must tap button for close dialog!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Enviar uma menssagem ao vendedor: ' +
                                          widget.lista[widget.index].empresa!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            fontSize: 16,
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .color!
                                                .withOpacity(1),
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),
                                    content: Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Card(
                                        elevation: 1,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        color: const Color(0xFFeceff3),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20.0),
                                                child: TextField(
                                                  maxLength: 224,
                                                  controller: pedidosController
                                                      .mensagemVendedor,
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText: 'Enviar Mensagem',
                                                    counterText: "",
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(
                                                Icons.send,
                                                color: Color(0xFF012f7a),
                                              ),
                                              onPressed: () {
                                                if (pedidosController
                                                    .mensagemVendedor
                                                    .text
                                                    .isNotEmpty) {
                                                  pedidosController
                                                      .enviaMensagem(
                                                          pedidosController
                                                              .mensagemVendedor
                                                              .text,
                                                          authController
                                                              .usuario!
                                                              .empresa_id!,
                                                          authController
                                                              .usuario!.id!);

                                                  showDialog(
                                                    context: context,
                                                    barrierDismissible: false,
                                                    builder:
                                                        (BuildContext context) {
                                                      Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  2000), () {
                                                        pedidosController
                                                            .mensagemVendedor
                                                            .clear();
                                                        Navigator.of(context)
                                                            .pop();
                                                        Navigator.of(context)
                                                            .pop();
                                                        Modular.to
                                                            .pushNamed('/chat');
                                                      });
                                                      return AlertDialog(
                                                        content: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: const [
                                                            CircularProgressIndicator(
                                                              strokeWidth: 1,
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Text(
                                                              "Enviando...",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black54),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text(
                                          'Cancelar',
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop(context);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            // color: Theme.of(context).primaryColor,
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(5.0),
                            // ),
                            child: Text(
                              "Falar com o vendedor",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          //horizontal: kDefaultPadding * 2,
                          vertical: kDefaultPadding * 0.1),
                      child: ButtonTheme(
                          minWidth: 100,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: widget.lista[widget.index].status_pedido!
                                        .toUpperCase() !=
                                    "EM ANDAMENTO"
                                ? () {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (BuildContext context2) {
                                        return AlertDialog(
                                            content: Text(
                                              'A situa????o do seu pedido n??o permite mais o cancelamento.',
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context2)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                    fontSize: 16,
                                                    color: Colors.black87,
                                                  ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                child: Text(
                                                  'Cancelar',
                                                  style: Theme.of(context2)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                        fontSize: 14,
                                                        color: Colors.black54,
                                                      ),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context2)
                                                      .pop(context2);
                                                },
                                              ),
                                            ]);
                                      },
                                    );
                                  }
                                : () {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (BuildContext context2) {
                                        return AlertDialog(
                                          title: Text(
                                            'Cancelar Pedido',
                                            style: Theme.of(context2)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                ),
                                          ),
                                          content: Text(
                                            'Deseja mesmo cancelar seu pedido?',
                                            style: Theme.of(context2)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                  fontSize: 14,
                                                  color: Colors.black87,
                                                ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child: Text(
                                                'Voltar',
                                                style: Theme.of(context2)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                      fontSize: 14,
                                                      color: Colors.black54,
                                                    ),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context2)
                                                    .pop(context2);
                                              },
                                            ),
                                            TextButton(
                                              child: Text(
                                                'Confirmar',
                                                style: Theme.of(context2)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                      fontSize: 14,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                    ),
                                              ),
                                              onPressed: () {
                                                pedidosController.cancelaPedido(
                                                    widget.lista[widget.index]
                                                        .id!,
                                                    "CANCELADO");

                                                showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder:
                                                      (BuildContext context3) {
                                                    Future.delayed(
                                                        const Duration(
                                                            milliseconds: 2000),
                                                        () {
                                                      pedidosController
                                                          .chamarListaEntregue();
                                                      pedidosController
                                                          .chamarListaEmAndamento();
                                                      pedidosController
                                                          .chamarListaNaoEntregueCancelado();
                                                      Navigator.of(context3)
                                                          .pop();
                                                      Navigator.of(context3)
                                                          .pop();
                                                    });
                                                    return AlertDialog(
                                                      content: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: const [
                                                          CircularProgressIndicator(
                                                            strokeWidth: 1,
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Text(
                                                            "Cancelando o pedido, aguarde.",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black54),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                            // color: widget.lista[widget.index].status_pedido
                            //             .toUpperCase() ==
                            //         "EM ANDAMENTO"
                            //     ? Theme.of(context).colorScheme.secondary
                            //     : Colors.grey,
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(5.0),
                            // ),
                            child: Text(
                              "Cancelar",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
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
