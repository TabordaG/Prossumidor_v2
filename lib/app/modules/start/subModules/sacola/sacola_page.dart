import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/components/button.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'sacola_controller.dart';

class SacolaPage extends StatefulWidget {
  final String title;
  const SacolaPage({Key key, this.title = "Sacola"}) : super(key: key);

  @override
  _SacolaPageState createState() => _SacolaPageState();
}

class _SacolaPageState extends ModularState<SacolaPage, SacolaController> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.shopping_bag,
              color: Colors.white,
            ),
            SizedBox(
              width: kDefaultPadding * .25,
            ),
            Text(widget.title),
          ],
        ),
        actions: [
          IconButton(
            splashRadius: 2,
            icon: Icon(
              Icons.info,
              color: Colors.white,
            ),
            onPressed: () {
              print('Pressed');
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: kDefaultPadding * .5),
              child: Text(
                'Total de Itens: 5',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(.8),
                    ),
              ),
            ),
            Divider(
              thickness: .3,
              color:
                  Theme.of(context).textTheme.bodyText1.color.withOpacity(.8),
            ),
            Expanded(
              child: Scrollbar(
                controller: scrollController,
                radius: Radius.circular(10),
                thickness: 3,
                isAlwaysShown: true,
                child: ListView.builder(
                  controller: scrollController,
                  physics: BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          right: kDefaultPadding * .1,
                          bottom: kDefaultPadding * .3,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              child: Container(
                                height: 90,
                                width: 90,
                                child: Image(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    produtoList[index].imagem,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: kDefaultPadding * .5,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    produtoList[index].nome,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                          fontSize: 16,
                                        ),
                                  ),
                                  Text(
                                    produtoList[index].produtor,
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                          fontSize: 12,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .color
                                              .withOpacity(.8),
                                        ),
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            controller.decrement();
                                          });
                                        },
                                        child: Card(
                                          elevation: 1,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 30,
                                        child: Center(
                                          child: Text(
                                            controller.value.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            controller.increment(
                                                produtoList[index].estoque);
                                          });
                                        },
                                        child: Card(
                                          elevation: 1,
                                          color: Theme.of(context).primaryColor,
                                          child: Icon(
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
                                      .copyWith(
                                        fontSize: 12,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .color
                                            .withOpacity(.8),
                                      ),
                                  children: [
                                    TextSpan(text: 'Valor Unit.'),
                                    TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                            fontSize: 11,
                                          ),
                                      text: '\nR\$ ' +
                                          produtoList[index]
                                              .preco
                                              .toStringAsFixed(2),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Center(
                              child: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  size: 20,
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Divider(
              thickness: .3,
              color:
                  Theme.of(context).textTheme.bodyText1.color.withOpacity(.8),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: kDefaultPadding * .2,
                left: kDefaultPadding * .5,
                right: kDefaultPadding * .5,
                bottom: kDefaultPadding * .8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Observer(builder: (_) {
                    return Text(
                      'R\$ 40,00',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                    );
                  }),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: kDefaultPadding * .5),
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
