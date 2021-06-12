import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoriaList[widget.indexCategorias]),
        actions: [
          IconButton(
            splashRadius: 2,
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
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
              itemCount: subcategoriaList.length,
              itemBuilder: (context, indexSub) => CardSubcategoria(
                index: indexSub,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
              ),
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (_, indexProduto) => CardProdutosCategoria(
                  index: indexProduto,
                  verDetalhes: () => Modular.to.pushNamed('/produtoDetalhes'),
                ),
              ),
            ),
          ),
        ],
      ),
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: widget.index == 0 ? kDefaultPadding * .8 : 0.0),
      child: Card(
        color: subcategoriaList[widget.index].ativo
            ? Theme.of(context).primaryColor
            : Theme.of(context).colorScheme.secondary,
        child: Padding(
          padding: EdgeInsets.all(kDefaultPadding * .3),
          child: Text(
            subcategoriaList[widget.index].nome,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
