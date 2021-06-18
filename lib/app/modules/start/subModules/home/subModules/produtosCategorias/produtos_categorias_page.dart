import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/components/cards.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'produtos_categorias_controller.dart';

class ProdutosCategoriasPage extends StatefulWidget {
  final int indexCategorias;
  ProdutosCategoriasPage({Key key, this.indexCategorias}) : super(key: key);

  @override
  _ProdutosCategoriasPageState createState() => _ProdutosCategoriasPageState();
}

class _ProdutosCategoriasPageState
    extends ModularState<ProdutosCategoriasPage, ProdutosCategoriasController> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: controller.isSearching
              ? buildSearchField()
              : Text(categoriaList[widget.indexCategorias]),
          actions: [
            IconButton(
              splashRadius: 2,
              icon: Icon(
                controller.isSearching ? Icons.close : Icons.search,
                color: Colors.white,
              ),
              onPressed: () => controller.setIsSearching(),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: kDefaultPadding,
                top: kDefaultPadding * .6,
                bottom: kDefaultPadding * .2,
              ),
              child: Text(
                'Subcategorias',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(.8),
                    ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5.0),
              height: 38,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: controller.subcategorias.length,
                itemBuilder: (context, indexSub) => CardSubcategoria(
                  index: indexSub,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: kDefaultPadding, right: kDefaultPadding - 10),
                child: Scrollbar(
                  controller: scrollController,
                  thickness: 3,
                  radius: Radius.circular(10),
                  isAlwaysShown: true,
                  child: GridView.builder(
                    controller: scrollController,
                    padding: EdgeInsets.only(right: 10),
                    physics: BouncingScrollPhysics(),
                    itemCount: produtoList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.68,
                    ),
                    itemBuilder: (_, indexProduto) => CardProdutosCategoria(
                      index: indexProduto,
                      verDetalhes: () => Modular.to.pushNamed(
                        '/produtoDetalhes',
                        arguments: {
                          'produto': produtoList[indexProduto],
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget buildSearchField() {
    return TextField(
      controller: controller.buscarText,
      textInputAction: TextInputAction.search,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Procurar Produto...",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white54),
      ),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
      onSubmitted: (value) => controller.buscarProduto(),
    );
  }
}

class CardSubcategoria extends StatefulWidget {
  final int index;
  const CardSubcategoria({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  _CardSubcategoriaState createState() => _CardSubcategoriaState();
}

class _CardSubcategoriaState extends State<CardSubcategoria> {
  ProdutosCategoriasController controller =
      Modular.get<ProdutosCategoriasController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: widget.index == 0 ? kDefaultPadding * .8 : 0.0),
      child: Observer(builder: (_) {
        return InkWell(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          onTap: () {
            controller.selecionarSubcategoria(widget.index);
          },
          child: Card(
            color: controller.subcategorias[widget.index].ativo
                ? Theme.of(context).primaryColor
                : Theme.of(context).colorScheme.secondary,
            child: Padding(
              padding: EdgeInsets.all(kDefaultPadding * .3),
              child: Text(
                controller.subcategorias[widget.index].nome,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
