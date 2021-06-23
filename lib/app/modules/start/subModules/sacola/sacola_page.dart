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
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: Observer(builder: (_) {
                return ExpansionTile(
                  onExpansionChanged: (value) {
                    setState(() {
                      controller.setVerDetalhes(value);
                    });
                  },
                  tilePadding: EdgeInsets.only(left: kDefaultPadding),
                  title: Card(
                    child: Padding(
                      padding: EdgeInsets.all(kDefaultPadding * .25),
                      child: Center(
                        child: Text(
                          controller.verDetalhes
                              ? 'Ocultar Detalhes'
                              : 'Ver Detalhes',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                      ),
                    ),
                  ),
                  trailing: Text(''),
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: kDefaultPadding * .3,
                        left: kDefaultPadding * .5,
                        right: kDefaultPadding * .5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sub-Total',
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      fontSize: 16,
                                    ),
                          ),
                          Text(
                            'R\$ 40,00',
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      fontSize: 16,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: .3,
                      indent: kDefaultPadding * .5,
                      endIndent: kDefaultPadding * .5,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(.4),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: kDefaultPadding * .5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio(
                                value: 0,
                                activeColor: Theme.of(context).primaryColor,
                                groupValue: controller.entrega,
                                onChanged: (value) {
                                  setState(() {
                                    controller.setEntrega(value);
                                  });
                                },
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    controller.setEntrega(0);
                                  });
                                },
                                child: Text(
                                  'Entrega em\ndomicílio',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
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
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio(
                                value: 1,
                                activeColor: Theme.of(context).primaryColor,
                                groupValue: controller.entrega,
                                onChanged: (value) {
                                  setState(() {
                                    controller.setEntrega(value);
                                  });
                                },
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    controller.setEntrega(1);
                                  });
                                },
                                child: Text(
                                  'Retirar no Local',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: kDefaultPadding * .2,
                        left: kDefaultPadding * .5,
                        right: kDefaultPadding * .5,
                        bottom: kDefaultPadding * .25,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Taxa de Entrega',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            'R\$ 5,00',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: .3,
                      indent: kDefaultPadding * .5,
                      endIndent: kDefaultPadding * .5,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(.4),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: kDefaultPadding * .6,
                        right: kDefaultPadding * .5,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: kDefaultPadding * .8,
                          ),
                          Text(
                            'Visualizar Endereço',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(fontSize: 14),
                          ),
                          Spacer(),
                          Icon(
                            Icons.chevron_right,
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),

                      // ListTile(
                      //   leading: Icon(
                      //     Icons.location_on,
                      //     color: Theme.of(context).primaryColor,
                      //   ),
                      //   title: Text(
                      //     'Visualizar Endereço',
                      //     style: Theme.of(context)
                      //         .textTheme
                      //         .bodyText1
                      //         .copyWith(fontSize: 16),
                      //   ),
                      //   trailing: Icon(
                      //     Icons.chevron_right,
                      //     color: Theme.of(context).primaryColor,
                      //   ),
                      // ),
                    ),
                    Divider(
                      thickness: .3,
                      indent: kDefaultPadding * .5,
                      endIndent: kDefaultPadding * .5,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(.4),
                    ),
                  ],
                );
              }),
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
                    'Total',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Text(
                    'R\$ 45,00',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
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
                    onPressed: () {},
                    color: Theme.of(context).primaryColor,
                    text: 'Confirmar Pedido',
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
