import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/dados_basicos.dart';
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
  void initState() {
    controller.setProduto(widget.produto);
    super.initState();
  }

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
          Stack(
            children: [
              IconButton(
                splashRadius: 2,
                icon: Icon(
                  Icons.shopping_bag,
                  color: Theme.of(context).textTheme.bodyText1.color,
                ),
                onPressed: () => Modular.to.pushNamed('/sacola'),
              ),
              Observer(builder: (_) {
                if (!controller.adicionado) return Container();
                return Positioned(
                  left: 11,
                  top: 14,
                  child: Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: kDefaultPadding * .5, bottom: kDefaultPadding),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Observer(builder: (_) {
                      if (controller.produto.imagem != null &&
                          controller.produto.imagem != "")
                        return CachedNetworkImage(
                          imageUrl: "${Basicos.ip2}/media/" +
                              controller.produto.imagem,
                          placeholder: (context, url) => Padding(
                            padding: EdgeInsets.all(35.0),
                            child: Container(
                              width: 40,
                              child: CircularProgressIndicator(
                                strokeWidth: 1,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          fit: BoxFit.contain,
                        );
                      return Center(
                        child: Icon(Icons.error),
                      );
                    }),
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
                    child: Observer(builder: (_) {
                      return Text(
                        controller.produto.descricao_simplificada,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                      );
                    }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: kDefaultPadding),
                    child: Observer(builder: (_) {
                      return Text(
                        'R\$ ' +
                            double.parse(controller.produto.preco_venda)
                                .toStringAsFixed(2)
                                .replaceAll('.', ','),
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                      );
                    }),
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
                    child: Observer(builder: (_) {
                      return Text(
                        controller.produto.marca,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 12,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .color
                                  .withOpacity(.8),
                            ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: kDefaultPadding * .8),
              child: Observer(builder: (_) {
                if (controller.produto.marketing == null) {
                  return Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                    ),
                  );
                }
                return Text(
                  controller.produto.marketing,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: 14,
                      ),
                );
              }),
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
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            Padding(
              padding: EdgeInsets.only(top: kDefaultPadding * .8),
              child: Observer(builder: (_) {
                if (controller.produto.observacoes == null) {
                  return Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                    ),
                  );
                }
                return Text(
                  controller.produto.observacoes,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: 14,
                      ),
                );
              }),
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
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Observer(builder: (_) {
                    if (controller.produto.estoque_atual == null) {
                      return Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                        ),
                      );
                    }
                    return Text(
                      double.parse(controller.produto.estoque_atual)
                          .toStringAsFixed(2),
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 14,
                          ),
                    );
                  }),
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
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Observer(builder: (_) {
                    return Text(
                      controller.produto.unidade_medida,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 14,
                          ),
                    );
                  }),
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
                  onTap: () => controller.increment(),
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
              onPressed: () {
                controller.adicionarSacola(context);
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    // retorna um objeto do tipo Dialog
                    return AlertDialog(
                      content: Observer(builder: (_) {
                        if (controller.adicionandoSacola)
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircularProgressIndicator(
                                strokeWidth: 1,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Adicionando...",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          );
                        return Text(
                          controller.adicionarMensagem,
                          style: TextStyle(
                            color: Colors.black.withOpacity(.7),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        );
                      }),
                    );
                  },
                );
              },
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
