import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/components/cards.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/models/categoria/categoria_model.dart';
import 'package:prossumidor_v2/app/models/marca/marca_model.dart';
import 'produtos_categorias_controller.dart';

class ProdutosCategoriasPage extends StatefulWidget {
  final MarcaProduto marcaProduto;
  final CategoriaProduto categoriaProduto;
  final bool isCategoria;
  ProdutosCategoriasPage({
    this.marcaProduto,
    this.categoriaProduto,
    this.isCategoria,
  }) : super();

  @override
  _ProdutosCategoriasPageState createState() => _ProdutosCategoriasPageState();
}

class _ProdutosCategoriasPageState
    extends ModularState<ProdutosCategoriasPage, ProdutosCategoriasController> {
  ScrollController scrollController;

  scrollListener() async {
    if (scrollController.position.atEdge &&
        scrollController.position.pixels > 0 &&
        controller.habilitarNovaBusca) {
      await controller.carregarMaisProdutos(
        context,
        widget.isCategoria,
        widget.marcaProduto,
        widget.categoriaProduto,
      );
    }
  }

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    if (widget.isCategoria)
      controller.buscarSubcategorias(widget.categoriaProduto.categoria.id);
    controller.carregarProdutos(
      widget.isCategoria,
      widget.marcaProduto,
      widget.categoriaProduto,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: controller.isSearching
              ? buildSearchField()
              : Text(
                  widget.isCategoria
                      ? widget.categoriaProduto.categoria.descricao
                      : widget.marcaProduto.marca.descricao,
                ),
          actions: [
            IconButton(
              splashRadius: 2,
              icon: Icon(
                controller.isSearching ? Icons.close : Icons.search,
                color: Colors.white,
              ),
              onPressed: () => {
                controller.setIsSearching(),
                controller.isSearching
                    ? null
                    : controller.carregarProdutos(widget.isCategoria,
                        widget.marcaProduto, widget.categoriaProduto)
              },
            ),
          ],
        ),
        body: Observer(builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              widget.isCategoria
                  ? Padding(
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
                    )
                  : Container(),
              widget.isCategoria
                  ? Container(
                      margin: EdgeInsets.only(bottom: 5.0),
                      height: 38,
                      child: Observer(builder: (_) {
                        if (controller.subcategorias.isEmpty)
                          return Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 1,
                            ),
                          );
                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.subcategorias.length,
                          itemBuilder: (context, indexSub) => CardSubcategoria(
                            index: indexSub,
                            isCategoria: widget.isCategoria,
                            marcaProduto: widget.marcaProduto,
                            categoriaProduto: widget.categoriaProduto,
                          ),
                        );
                      }),
                    )
                  : Container(),
              Expanded(
                child: Observer(builder: (_) {
                  if (controller.buscandoProdutos)
                    return Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                      ),
                    );
                  if (!controller.buscandoProdutos &&
                      controller.listaProdutos.isEmpty)
                    return Center(
                      child: Text(
                        "Produto não encotrado\nPara esta seção.",
                        textAlign: TextAlign.center,
                      ),
                    );
                  return Scrollbar(
                    controller: scrollController,
                    thickness: 5,
                    radius: Radius.circular(5),
                    child: GridView.count(
                      controller: scrollController,
                      physics: BouncingScrollPhysics(),
                      primary: false,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: List.generate(
                        controller.listaProdutos.length,
                        (index) => CardHome(
                          index: index,
                          produto: controller.listaProdutos[index],
                          verDetalhes: () => Modular.to.pushNamed(
                            '/produtoDetalhes',
                            arguments: {
                              'produto': controller.listaProdutos[index],
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              if (controller.buscandoMaisProdutos)
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                    ),
                  ),
                ),
            ],
          );
        }),
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
      onSubmitted: (value) => controller.pesquisarProduto(
        widget.isCategoria,
        widget.marcaProduto,
        widget.categoriaProduto,
      ),
    );
  }
}

class CardSubcategoria extends StatefulWidget {
  final int index;
  final MarcaProduto marcaProduto;
  final CategoriaProduto categoriaProduto;
  final bool isCategoria;
  const CardSubcategoria({
    Key key,
    this.index,
    this.marcaProduto,
    this.categoriaProduto,
    this.isCategoria,
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
            controller.selecionarSubcategoria(
              widget.index,
              widget.isCategoria,
              widget.marcaProduto,
              widget.categoriaProduto,
            );
          },
          child: Card(
            color: controller.subcategorias[widget.index].ativo
                ? Theme.of(context).primaryColor
                : Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(kDefaultPadding * .3),
              child: Text(
                controller.subcategorias[widget.index].nome,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.w600,
                      color: controller.subcategorias[widget.index].ativo
                          ? Colors.white
                          : Colors.black,
                    ),
              ),
            ),
          ),

          // Card(
          //                           color: Colors.white,
          //                           shape: RoundedRectangleBorder(
          //                             side: BorderSide(color: kPrimaryColor),
          //                             borderRadius: BorderRadius.all(
          //                               Radius.circular(5),
          //                             ),
          //                           ),
          //                           child: Padding(
          //                             padding:
          //                                 EdgeInsets.all(kDefaultPadding * .3),
          //                             child: Text(
          //                               controller
          //                                   .produto.categorias[i].descricao,
          //                               maxLines: 1,
          //                               overflow: TextOverflow.ellipsis,
          //                               style: Theme.of(context)
          //                                   .textTheme
          //                                   .bodyText1
          //                                   .copyWith(
          //                                     fontWeight: FontWeight.w600,
          //                                     color: Colors.black,
          //                                   ),
          //                             ),
          //                           ),
          //                         );
        );
      }),
    );
  }
}
