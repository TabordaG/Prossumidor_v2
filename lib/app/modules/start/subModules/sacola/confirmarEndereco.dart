import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/components/button.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/sacola/sacola_controller.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';

class ConfirmarEndereco extends StatefulWidget {
  const ConfirmarEndereco({Key key}) : super(key: key);

  @override
  _ConfirmarEnderecoState createState() => _ConfirmarEnderecoState();
}

class _ConfirmarEnderecoState extends State<ConfirmarEndereco> {
  SacolaController controller = Modular.get<SacolaController>();
  AuthController authController = Modular.get<AuthController>();

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
            Text('Sacola'),
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
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding * .5,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: kDefaultPadding * .5,
                            left: kDefaultPadding * .5,
                            right: kDefaultPadding * .5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sub-Total',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      fontSize: 18,
                                    ),
                              ),
                              Text(
                                'R\$ 40,00',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      fontSize: 18,
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
                            bottom: kDefaultPadding * .5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Taxa de Entrega',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              Observer(builder: (_) {
                                return Text(
                                  'R\$ ' +
                                      controller.frete
                                          .toStringAsFixed(2)
                                          .replaceAll('.', ','),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                        fontSize: 16,
                                      ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (controller.entrega == 0) {}
                    },
                    child: Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.location_on,
                          color: Theme.of(context).primaryColor,
                        ),
                        title: Text(
                          controller.entrega == 0
                              ? 'Entregar em'
                              : 'Retirar em',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontSize: 16),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.entrega == 0
                                  ? authController.usuario.endereco +
                                      ', ' +
                                      authController.usuario.numero
                                  : 'Porto, 0',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color
                                        .withOpacity(.6),
                                  ),
                            ),
                            Text(
                              controller.entrega == 0
                                  ? authController.usuario.bairro +
                                      ' - ' +
                                      authController.usuario.complemento
                                  : 'Corimbatá',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color
                                        .withOpacity(.6),
                                  ),
                            ),
                          ],
                        ),
                        trailing: Icon(
                          controller.entrega == 0
                              ? Icons.chevron_right
                              : Icons.info,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                        vertical: kDefaultPadding * .5,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Como pretende pagar ao retirar o seu pedido ?',
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .color
                                          .withOpacity(.8),
                                    ),
                          ),
                          SizedBox(
                            height: kDefaultPadding * .25,
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 0,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                activeColor: Theme.of(context).primaryColor,
                                groupValue: controller.pagamento,
                                onChanged: (value) {
                                  setState(() {
                                    controller.setPagamento(value);
                                  });
                                },
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    controller.setPagamento(0);
                                  });
                                },
                                child: Text(
                                  'Dinheiro',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 1,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                activeColor: Theme.of(context).primaryColor,
                                groupValue: controller.pagamento,
                                onChanged: (value) {
                                  setState(() {
                                    controller.setPagamento(value);
                                  });
                                },
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    controller.setPagamento(1);
                                  });
                                },
                                child: Text(
                                  'Cartão Crédito',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 2,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                activeColor: Theme.of(context).primaryColor,
                                groupValue: controller.pagamento,
                                onChanged: (value) {
                                  setState(() {
                                    controller.setPagamento(value);
                                  });
                                },
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    controller.setPagamento(2);
                                  });
                                },
                                child: Text(
                                  'Cartão Débito',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 3,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                activeColor: Theme.of(context).primaryColor,
                                groupValue: controller.pagamento,
                                onChanged: (value) {
                                  setState(() {
                                    controller.setPagamento(value);
                                  });
                                },
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    controller.setPagamento(3);
                                  });
                                },
                                child: Text(
                                  'Pix',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 4,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                activeColor: Theme.of(context).primaryColor,
                                groupValue: controller.pagamento,
                                onChanged: (value) {
                                  setState(() {
                                    controller.setPagamento(value);
                                  });
                                },
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    controller.setPagamento(4);
                                  });
                                },
                                child: Text(
                                  'Outros',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: kDefaultPadding * .75,
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
                  Observer(builder: (_) {
                    return Text(
                      'R\$ ' +
                          controller.total
                              .toStringAsFixed(2)
                              .replaceAll('.', ','),
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                    );
                  }),
                ],
              ),
            ),
            Center(
              child: ButtonTheme(
                minWidth: double.infinity,
                height: 45,
                child: StandardButton(
                  onPressed: () => Modular.to.pushNamedAndRemoveUntil(
                    '/start',
                    ModalRoute.withName('/'),
                  ),
                  color: Theme.of(context).primaryColor,
                  text: 'Finalizar Pedido',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
