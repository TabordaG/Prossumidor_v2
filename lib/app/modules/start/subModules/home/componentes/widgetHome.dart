// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/components/cards.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/home/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:prossumidor_v2/app/dados_basicos.dart';

class WidgetHome extends StatefulWidget {
  final int indexItem;
  final Function verMais;
  final bool isCategoria;

  const WidgetHome({
    required this.indexItem,
    required this.verMais,
    this.isCategoria = true,
  }) : super();

  @override
  _WidgetHomeState createState() => _WidgetHomeState();
}

class _WidgetHomeState extends State<WidgetHome> {
  HomeController controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: kDefaultPadding * .5,
          ),
          child: Divider(
            thickness: 4,
            color: Theme.of(context).colorScheme.secondary.withOpacity(.2),
          ),
        ),
        Observer(builder: (_) {
          return ListTile(
            leading: widget.isCategoria
                ? CachedNetworkImage(
                    width: 30,
                    imageUrl: '${Basicos.ip}/' +
                        controller.listaCategoriaProdutos[widget.indexItem]
                            .categoria!.imagem_cat![0],
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : const Icon(Icons.storefront, color: Colors.black),
            title: Text(
              widget.isCategoria
                  ? "${controller.listaCategoriaProdutos[widget.indexItem].categoria?.descricao}"
                  : "${controller.listaMarcaProdutos[widget.indexItem].marca!.descricao}",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 18,
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .color!
                        .withOpacity(1),
                  ),
            ),
            trailing: TextButton(
              onPressed: () {
                widget.verMais();
              },
              child: Text(
                'Ver mais',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 14,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
          );
        }),
        Observer(builder: (_) {
          if (controller.buscandoProdutos) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 1,
              ),
            );
          }
          if (widget.isCategoria &&
              !controller.buscandoProdutos &&
              controller
                  .listaCategoriaProdutos[widget.indexItem].produtos!.isEmpty) {
            return const SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  "Não encontrado\nprodutos em anúncio",
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          if (!widget.isCategoria &&
              !controller.buscandoProdutos &&
              controller
                  .listaMarcaProdutos[widget.indexItem].produtos!.isEmpty) {
            return const SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  "Não encontrado\nprodutos em anúncio",
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return Container(
            height: 235,
            margin: EdgeInsets.only(
              bottom: widget.isCategoria
                  ? widget.indexItem ==
                          controller.listaCategoriaProdutos.length - 1
                      ? kDefaultPadding
                      : 0.0
                  : widget.indexItem == controller.listaMarcaProdutos.length - 1
                      ? kDefaultPadding
                      : 0.0,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.isCategoria
                  ? controller
                      .listaCategoriaProdutos[widget.indexItem].produtos!.length
                  : controller
                      .listaMarcaProdutos[widget.indexItem].produtos!.length,
              itemBuilder: (context, index) {
                return index != 4
                    ? CardHome(
                        index: index,
                        margin: true,
                        produto: widget.isCategoria
                            ? controller
                                .listaCategoriaProdutos[widget.indexItem]
                                .produtos![index]
                            : controller.listaMarcaProdutos[widget.indexItem]
                                .produtos![index],
                        verDetalhes: () {
                          return Modular.to.pushNamed(
                            '/produtoDetalhes',
                            arguments: {
                              'produto': widget.isCategoria
                                  ? controller
                                      .listaCategoriaProdutos[widget.indexItem]
                                      .produtos![index]
                                  : controller
                                      .listaMarcaProdutos[widget.indexItem]
                                      .produtos![index],
                            },
                          );
                        },
                      )
                    : Row(
                        children: [
                          CardHome(
                            index: index,
                            produto: widget.isCategoria
                                ? controller
                                    .listaCategoriaProdutos[widget.indexItem]
                                    .produtos![index]
                                : controller
                                    .listaMarcaProdutos[widget.indexItem]
                                    .produtos![index],
                            verDetalhes: () => Modular.to.pushNamed(
                              '/produtoDetalhes',
                              arguments: {
                                'produto': widget.isCategoria
                                    ? controller
                                        .listaCategoriaProdutos[
                                            widget.indexItem]
                                        .produtos![index]
                                    : controller
                                        .listaMarcaProdutos[widget.indexItem]
                                        .produtos![index],
                              },
                            ),
                          ),
                          CardVerMaisHome(
                            indexItem: widget.indexItem,
                            verMais: widget.verMais,
                          ),
                        ],
                      );
              },
            ),
          );
        }),
      ],
    );
  }
}
