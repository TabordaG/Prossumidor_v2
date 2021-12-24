import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/components/cards.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/home/home_controller.dart';

class WidgetHome extends StatefulWidget {
  final int indexItem;
  final Function verMais;
  final bool isCategoria;

  WidgetHome({
    Key key,
    this.indexItem,
    this.verMais,
    this.isCategoria = true,
  }) : super(key: key);

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
          padding: EdgeInsets.only(
            top: kDefaultPadding * .5,
          ),
          child: Divider(
            thickness: 4,
            color: Theme.of(context).colorScheme.secondary.withOpacity(.2),
          ),
        ),
        Observer(builder: (_) {
          return ListTile(
            leading: Icon(Icons.fastfood),
            title: Text(
              widget.isCategoria
                  ? controller.listaCategoriaProdutos[widget.indexItem]
                      .categoria.descricao
                  : controller
                      .listaMarcaProdutos[widget.indexItem].marca.descricao,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 18,
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .color
                        .withOpacity(1),
                  ),
            ),
            trailing: TextButton(
              onPressed: widget.verMais,
              child: Text(
                'Ver mais',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: 14,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
          );
        }),
        Observer(builder: (_) {
          if (controller.buscandoProdutos)
            return Container(
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                ),
              ),
            );
          if (widget.isCategoria &&
              !controller.buscandoProdutos &&
              controller
                  .listaCategoriaProdutos[widget.indexItem].produtos.isEmpty)
            return Container(
              height: 100,
              child: Center(
                child: Text(
                  "Não encontrado\nprodutos em anúncio",
                  textAlign: TextAlign.center,
                ),
              ),
            );
          if (!widget.isCategoria &&
              !controller.buscandoProdutos &&
              controller.listaMarcaProdutos[widget.indexItem].produtos.isEmpty)
            return Container(
              height: 100,
              child: Center(
                child: Text(
                  "Não encontrado\nprodutos em anúncio",
                  textAlign: TextAlign.center,
                ),
              ),
            );
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
              physics: BouncingScrollPhysics(),
              itemCount: widget.isCategoria
                  ? controller
                      .listaCategoriaProdutos[widget.indexItem].produtos.length
                  : controller
                      .listaMarcaProdutos[widget.indexItem].produtos.length,
              itemBuilder: (context, index) {
                return index != 4
                    ? CardHome(
                        index: index,
                        margin: true,
                        produto: widget.isCategoria
                            ? controller
                                .listaCategoriaProdutos[widget.indexItem]
                                .produtos[index]
                            : controller.listaMarcaProdutos[widget.indexItem]
                                .produtos[index],
                        verDetalhes: () => Modular.to.pushNamed(
                          '/produtoDetalhes',
                          arguments: {
                            'produto': widget.isCategoria
                                ? controller
                                    .listaCategoriaProdutos[widget.indexItem]
                                    .produtos[index]
                                : controller
                                    .listaMarcaProdutos[widget.indexItem]
                                    .produtos[index],
                          },
                        ),
                      )
                    : Row(
                        children: [
                          CardHome(
                            index: index,
                            produto: widget.isCategoria
                                ? controller
                                    .listaCategoriaProdutos[widget.indexItem]
                                    .produtos[index]
                                : controller
                                    .listaMarcaProdutos[widget.indexItem]
                                    .produtos[index],
                            verDetalhes: () => Modular.to.pushNamed(
                              '/produtoDetalhes',
                              arguments: {
                                'produto': widget.isCategoria
                                    ? controller
                                        .listaCategoriaProdutos[
                                            widget.indexItem]
                                        .produtos[index]
                                    : controller
                                        .listaMarcaProdutos[widget.indexItem]
                                        .produtos[index],
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
