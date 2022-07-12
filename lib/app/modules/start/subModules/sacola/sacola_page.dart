// ignore_for_file: use_key_in_widget_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/components/button.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/dados_basicos.dart';
import 'sacola_controller.dart';

class SacolaPage extends StatefulWidget {
  final String title;
  const SacolaPage({this.title = "Sacola"}) : super();

  @override
  _SacolaPageState createState() => _SacolaPageState();
}

class _SacolaPageState extends ModularState<SacolaPage, SacolaController> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    controller.buscarProdutos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.shopping_bag,
              color: Colors.white,
            ),
            const SizedBox(
              width: kDefaultPadding * .25,
            ),
            Text(widget.title),
          ],
        ),
        actions: [
          IconButton(
            splashRadius: 2,
            icon: const Icon(
              Icons.refresh_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              controller.buscarProdutos();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: kDefaultPadding * .5, bottom: kDefaultPadding * .5),
              child: Observer(builder: (_) {
                if (!controller.carregandoProdutos &&
                    controller.listaProdutos.isEmpty) return Container();
                return Text(
                  'Total de itens: ${controller.listaProdutos.length}',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.color
                            ?.withOpacity(.8),
                      ),
                );
              }),
            ),
            Expanded(
              child: Observer(builder: (_) {
                if (controller.carregandoProdutos) {
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                    ),
                  );
                }
                if (!controller.carregandoProdutos &&
                    controller.listaProdutos.isEmpty) {
                  return const Center(
                    child: Text("Carrinho Vazio.."),
                  );
                }
                return Scrollbar(
                  controller: scrollController,
                  radius: const Radius.circular(10),
                  thickness: 3,
                  isAlwaysShown: true,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: ListView.builder(
                      controller: scrollController,
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.listaProdutos.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                            right: kDefaultPadding * .1,
                            bottom: kDefaultPadding * .3,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 90,
                                width: 90,
                                child: Observer(builder: (_) {
                                  if (controller.listaProdutos.isNotEmpty &&
                                      controller.listaProdutos[index].imagem !=
                                          null &&
                                      controller.listaProdutos[index].imagem !=
                                          "") {
                                    return CachedNetworkImage(
                                      imageUrl: "${Basicos.ip2}/media/" +
                                          controller
                                              .listaProdutos[index].imagem!,
                                      placeholder: (context, url) =>
                                          const Padding(
                                        padding: EdgeInsets.all(35.0),
                                        child: SizedBox(
                                          width: 40,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 1,
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                      fit: BoxFit.contain,
                                    );
                                  }
                                  return const Center(
                                    child: Icon(Icons.error),
                                  );
                                }),
                              ),
                              const SizedBox(
                                width: kDefaultPadding * .5,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.listaProdutos[index]
                                              .descricao_simplificada ??
                                          "...",
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                            fontSize: 16,
                                          ),
                                    ),
                                    Text(
                                      controller.listaProdutos[index].marca ??
                                          "...",
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                            fontSize: 12,
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                ?.color
                                                ?.withOpacity(.8),
                                          ),
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              controller.decrement(index);
                                            });
                                          },
                                          child: Card(
                                            elevation: 1,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            child: const Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                          child: Center(
                                            child: Text(
                                              "${double.parse(controller.listaProdutos[index].quantidade ?? "0").toInt()}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  ?.copyWith(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              controller.increment(
                                                  index, context);
                                            });
                                          },
                                          child: Card(
                                            elevation: 1,
                                            color:
                                                Theme.of(context).primaryColor,
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
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
                                        ?.copyWith(
                                          fontSize: 12,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.color
                                              ?.withOpacity(.8),
                                        ),
                                    children: [
                                      const TextSpan(text: 'Valor Unit.'),
                                      TextSpan(
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                              fontSize: 11,
                                            ),
                                        text: '\nR\$ ' +
                                            double.parse(controller
                                                    .listaProdutos[index]
                                                    .preco_venda!)
                                                .toStringAsFixed(2)
                                                .replaceAll(".", ","),
                                      ),
                                      TextSpan(
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        text: '\n\nR\$ ' +
                                            (double.parse(controller
                                                        .listaProdutos[index]
                                                        .preco_venda!) *
                                                    double.parse(controller
                                                            .listaProdutos[
                                                                index]
                                                            .quantidade!)
                                                        .toInt())
                                                .toStringAsFixed(2)
                                                .replaceAll(".", ","),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Center(
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        // retorna um objeto do tipo Dialog
                                        return AlertDialog(
                                          title: const Text(
                                              "Deseja mesmo deletar item do carrinho ?"),
                                          content: Text(
                                            "Deletar item: ${controller.listaProdutos[index].descricao_simplificada}",
                                            style: const TextStyle(
                                              color: Colors.black54,
                                              fontSize: 14,
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text(
                                                "Cancelar",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            TextButton(
                                              child: const Text(
                                                "Deletar",
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              onPressed: () {
                                                controller.deletarItem(index);
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
            ),
            // Divider(
            //   thickness: .3,
            //   color:
            //       Theme.of(context).textTheme.bodyText1.color.withOpacity(.8),
            // ),
            Padding(
              padding: const EdgeInsets.only(
                top: kDefaultPadding * .7,
                left: kDefaultPadding * .5,
                right: kDefaultPadding * .5,
                bottom: kDefaultPadding * .8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Observer(builder: (_) {
                    return Text(
                      'R\$ ' +
                          controller.subtotal
                              .toStringAsFixed(2)
                              .replaceAll(".", ","),
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                    );
                  }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: kDefaultPadding * .5),
              child: Center(
                child: ButtonTheme(
                  minWidth: double.infinity,
                  height: 45,
                  child: StandardButton(
                    onPressed: () =>
                        Modular.to.pushNamed('/sacola/confirmarEndereco'),
                    color: Theme.of(context).primaryColor,
                    text: 'Confirmar Produtos',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
