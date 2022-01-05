import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prossumidor_v2/app/FadeAnimation.dart';
import 'package:prossumidor_v2/app/dados_basicos.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';

import '../constants.dart';

class CardHome extends StatefulWidget {
  final int index;
  final Produto produto;
  final Function verDetalhes;
  final bool margin;

  CardHome({
    
    this.index,
    this.produto,
    this.verDetalhes,
    this.margin = false,
  }) : super();

  @override
  _CardHomeState createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome> {
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      1, // (1.0 + widget.index) / 2,
      GestureDetector(
        onTap: widget.verDetalhes,
        child: Container(
          margin: EdgeInsets.only(
            left: widget.index == 0 && widget.margin
                ? kDefaultPadding * .7
                : kDefaultPadding * .2,
          ),
          height: 245,
          width: 150,
          child: Card(
            color: Color(0xFFF6F6F6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  child: Container(
                    height: 145,
                    width: double.infinity,
                    child: widget.produto.imagem != null &&
                            widget.produto.imagem != ""
                        ? CachedNetworkImage(
                            imageUrl:
                                "${Basicos.ip2}/media/" + widget.produto.imagem,
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
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: kDefaultPadding * .2,
                    right: kDefaultPadding * .2,
                    top: kDefaultPadding * .2,
                  ),
                  child: Text(
                    widget.produto.descricao_simplificada,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kDefaultPadding * .2),
                  child: Text(
                    widget.produto.marca,
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 12,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .color
                              .withOpacity(.8),
                        ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                    left: kDefaultPadding * .4,
                    right: kDefaultPadding * .4,
                    bottom: kDefaultPadding * .4,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'R\$ ' +
                            double.parse(widget.produto.preco_venda)
                                .toStringAsFixed(2)
                                .replaceAll('.', ','),
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            widget.produto.unidade_medida,
                            textAlign: TextAlign.right,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      fontSize: 11,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardVerMaisHome extends StatefulWidget {
  final int indexItem;
  final Function verMais;

  CardVerMaisHome({
   
    this.indexItem,
    this.verMais,
  }) : super();

  @override
  _CardVerMaisHomeState createState() => _CardVerMaisHomeState();
}

class _CardVerMaisHomeState extends State<CardVerMaisHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding * .2,
        right: kDefaultPadding * .7,
      ),
      height: 235,
      width: 150,
      child: InkWell(
        borderRadius: BorderRadius.circular(5.0),
        onTap: widget.verMais,
        child: Card(
          color: Color(0xFFF6F6F6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Text(
                'Ver mais',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: 14,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardProdutosCategoria extends StatefulWidget {
  final int index;
  final Produto produto;
  final Function verDetalhes;

  CardProdutosCategoria({
   
    this.index,
    this.produto,
    this.verDetalhes,
  }) : super();

  @override
  _CardProdutosCategoriaState createState() => _CardProdutosCategoriaState();
}

class _CardProdutosCategoriaState extends State<CardProdutosCategoria> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.verDetalhes,
      child: Container(
        // height: 235,
        width: double.infinity,
        child: Card(
          color: Color(0xFFF6F6F6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      widget.produto.imagem,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: kDefaultPadding * .2,
                  right: kDefaultPadding * .2,
                  top: kDefaultPadding * .2,
                ),
                child: Text(
                  widget.produto.descricao_simplificada,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: 14,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * .2),
                child: Text(
                  widget.produto.marca_produto_id.toString(),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: 12,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .color
                            .withOpacity(.8),
                      ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  left: kDefaultPadding * .2,
                  right: kDefaultPadding * .2,
                  bottom: kDefaultPadding * .2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'R\$ ' +
                          double.parse(widget.produto.preco_venda)
                              .toStringAsFixed(2),
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text(
                          widget.produto.unidade_medida,
                          textAlign: TextAlign.right,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                fontSize: 12,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
