import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';
import 'produto_detalhes_controller.dart';

class ProdutoDetalhesPage extends StatefulWidget {
  final Produto produto;
  const ProdutoDetalhesPage({Key key, this.produto}) : super(key: key);

  @override
  _ProdutoDetalhesPageState createState() => _ProdutoDetalhesPageState();
}

class _ProdutoDetalhesPageState
    extends ModularState<ProdutoDetalhesPage, ProdutoDetalhesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Theme.of(context).textTheme.bodyText1.color,
        ),
        title: Text(
          'Detalhes',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontSize: 20,
              ),
        ),
        centerTitle: true,
        elevation: 4.0,
        actions: [
          IconButton(
            splashRadius: 2,
            icon: Icon(
              Icons.shopping_bag,
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
            onPressed: () => Modular.to.pushNamed('/sacola'),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: kDefaultPadding * .5),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image(
                    width: 300,
                    height: 300,
                    image: AssetImage(widget.produto.imagem),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: kDefaultPadding * .5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      widget.produto.nome,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: kDefaultPadding),
                    child: Text(
                      'R\$ ' +
                          double.parse(widget.produto.preco).toStringAsFixed(2),
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: kDefaultPadding * .1,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: kDefaultPadding),
                    child: Text(
                      widget.produto.produtor,
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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: kDefaultPadding * .8),
              child: Text(
                widget.produto.descricao,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: 14,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding * .5),
              child: Divider(
                color:
                    Theme.of(context).textTheme.bodyText1.color.withOpacity(.2),
                thickness: .8,
              ),
            ),
            Text(
              'Condições do Produto',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            Padding(
              padding: EdgeInsets.only(top: kDefaultPadding * .8),
              child: Text(
                widget.produto.condicao,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: 14,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: kDefaultPadding),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: kDefaultPadding * 3.1),
                    child: Text(
                      'Estoque Atual',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  Text(
                    widget.produto.estoque.toString(),
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: kDefaultPadding * .8,
                bottom: kDefaultPadding,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: kDefaultPadding * 5),
                    child: Text(
                      'Unidade',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  Text(
                    widget.produto.unidade,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => controller.decrement(),
                  child: Card(
                    elevation: 4,
                    color: Theme.of(context).colorScheme.secondary,
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: 40,
                  child: Center(
                    child: Observer(builder: (_) {
                      return Text(
                        controller.value.toString(),
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                      );
                    }),
                  ),
                ),
                InkWell(
                  onTap: () => controller.increment(widget.produto.estoque),
                  child: Card(
                    elevation: 4,
                    color: Colors.white,
                    child: Icon(
                      Icons.add,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            RaisedButton(
              color: Colors.white,
              highlightColor: Colors.white,
              highlightElevation: 24,
              onPressed: () {},
              child: Text(
                'Adicionar a Sacola',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: 16,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
