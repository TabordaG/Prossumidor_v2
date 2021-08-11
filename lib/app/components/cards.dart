import 'package:flutter/material.dart';

import '../constants.dart';

class CardHome extends StatefulWidget {
  final int index;
  final Function verDetalhes;

  CardHome({
    Key key,
    this.index,
    this.verDetalhes,
  }) : super(key: key);

  @override
  _CardHomeState createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.verDetalhes,
      child: Container(
        margin: EdgeInsets.only(
          left: widget.index == 0 ? kDefaultPadding * .7 : kDefaultPadding * .2,
        ),
        height: 235,
        width: 150,
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
                  width: 150,
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      produtoList[widget.index].imagem,
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
                  produtoList[widget.index].nome,
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
                  produtoList[widget.index].produtor,
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
                          double.parse(produtoList[widget.index].preco)
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
                          produtoList[widget.index].unidade,
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

class CardVerMaisHome extends StatefulWidget {
  final int indexCategoria;
  final Function verMais;

  CardVerMaisHome({
    Key key,
    this.indexCategoria,
    this.verMais,
  }) : super(key: key);

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
  final Function verDetalhes;

  CardProdutosCategoria({
    Key key,
    this.index,
    this.verDetalhes,
  }) : super(key: key);

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
                      produtoList[widget.index].imagem,
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
                  produtoList[widget.index].nome,
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
                  produtoList[widget.index].produtor,
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
                          double.parse(produtoList[widget.index].preco)
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
                          produtoList[widget.index].unidade,
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
