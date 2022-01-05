import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/app_controller.dart';
import 'package:prossumidor_v2/app/components/button.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/sacola/sacola_controller.dart';
// import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';

class ConfirmarEndereco extends StatefulWidget {
  const ConfirmarEndereco() : super();

  @override
  _ConfirmarEnderecoState createState() => _ConfirmarEnderecoState();
}

class _ConfirmarEnderecoState extends State<ConfirmarEndereco> {
  SacolaController controller = Modular.get<SacolaController>();
  // AuthController authController = Modular.get<AuthController>();
  final AppController appController = Modular.get<AppController>();
  final FocusScopeNode node = FocusScopeNode();
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            // bottom: kDefaultPadding,
            left: kDefaultPadding * .5,
            right: kDefaultPadding * .5,
          ),
          child: Column(
            children: [
              // Expanded(
              // child: ListView(
              //   physics: BouncingScrollPhysics(),
              //   children: [
              Card(
                margin: EdgeInsets.only(
                  top: kDefaultPadding * .5,
                  bottom: kDefaultPadding * .2,
                  left: kDefaultPadding * .2,
                  right: kDefaultPadding * .2,
                ),
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
                            'Subtotal',
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      fontSize: 18,
                                    ),
                          ),
                          Observer(builder: (_) {
                            return Text(
                              'R\$ ' +
                                  controller.subtotal
                                      .toStringAsFixed(2)
                                      .replaceAll(".", ","),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    fontSize: 18,
                                  ),
                            );
                          }),
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
              Card(
                child: Observer(builder: (_) {
                  return ListTile(
                    onTap: () => controller.entrega == 0
                        ? buildEntregaDomicilio(context)
                        : buildRetirarLocal(context),
                    leading: Icon(
                      Icons.location_on,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      controller.entrega == 0 ? 'Entregar em' : 'Retirar em',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontSize: 16),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Observer(builder: (_) {
                          return Text(
                            controller.entrega == 0
                                ? controller.endereco.text +
                                    ', ' +
                                    controller.numero.text
                                : 'Porto, 0',
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .color
                                          .withOpacity(.6),
                                    ),
                          );
                        }),
                        Observer(builder: (_) {
                          return Text(
                            controller.entrega == 0
                                ? controller.bairro.text +
                                    ' - ' +
                                    controller.complemento.text
                                : 'Corimbatá',
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .color
                                          .withOpacity(.6),
                                    ),
                          );
                        }),
                      ],
                    ),
                    trailing: Icon(
                      controller.entrega == 0
                          ? Icons.chevron_right
                          : Icons.info,
                      color: Theme.of(context).primaryColor,
                    ),
                  );
                }),
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
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
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
                    onPressed: () async {
                      controller.inserePedido();
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Observer(builder: (_) {
                              if (!controller.pedidoFinalizado)
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
                                      "Registrando...",
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                );
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    controller.adicionarMensagem,
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(.7),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  RaisedButton(
                                    onPressed: () {
                                      setState(() {
                                        Navigator.of(context).pop();

                                        appController.pageViewController
                                            .jumpToPage(
                                          2,
                                        );

                                        Modular.to.popUntil(
                                            ModalRoute.withName('/start'));
                                       
                                      });
                                    },
                                    color: kPrimaryColor,
                                    child: Text(
                                      "Voltar Loja",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          );
                        },
                      );
                    },
                    color: Theme.of(context).primaryColor,
                    text: 'Finalizar Pedido',
                  ),
                ),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              //   ],
              // ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Future buildEntregaDomicilio(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: AlertDialog(
            title: Text("Alterar Endereço"),
            content: Scrollbar(
              controller: scrollController,
              radius: Radius.circular(10),
              thickness: 2,
              isAlwaysShown: true,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Observer(builder: (_) {
                  return Form(
                    child: FocusScope(
                      node: node,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        // shrinkWrap: true,
                        // physics: BouncingScrollPhysics(),
                        children: [
                          Observer(builder: (_) {
                            return TextFormField(
                              enabled: controller.entrega == 1 ? false : true,
                              // onChanged: (value) {
                              //   controller.endereco.text = value;
                              // },
                              keyboardType: TextInputType.streetAddress,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.words,
                              onEditingComplete: node.nextFocus,
                              controller: controller.endereco,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Insira um endereço válido';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Endereço',
                                border: UnderlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.apartment,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }),
                          SizedBox(
                            height: kDefaultPadding * 0.5,
                          ),
                          Observer(builder: (_) {
                            return TextFormField(
                              enabled: controller.entrega == 1 ? false : true,
                              // onChanged: (value) {
                              //   controller.numero.text = value;
                              // },
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: node.nextFocus,
                              controller: controller.numero,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(5),
                              ],
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Insira um número válido';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Número',
                                border: UnderlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.filter_1,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }),
                          SizedBox(
                            height: kDefaultPadding * 0.5,
                          ),
                          Observer(builder: (_) {
                            return TextFormField(
                              enabled: controller.entrega == 1 ? false : true,
                              // onChanged: (value) {
                              //   controller.complemento.text = value;
                              // },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: node.nextFocus,
                              controller: controller.complemento,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(250),
                              ],
                              decoration: InputDecoration(
                                labelText: 'Complemento',
                                border: UnderlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.house,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }),
                          SizedBox(
                            height: kDefaultPadding * 0.5,
                          ),
                          Observer(builder: (_) {
                            return TextFormField(
                              enabled: controller.entrega == 1 ? false : true,
                              // onChanged: (value) {
                              //   controller.bairro.text = value;
                              // },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.words,
                              onEditingComplete: node.nextFocus,
                              controller: controller.bairro,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Insira um bairro válido';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Bairro',
                                border: UnderlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.house_siding,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }),
                          SizedBox(
                            height: kDefaultPadding * 0.5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Observer(builder: (_) {
                                  return TextFormField(
                                    enabled:
                                        controller.entrega == 1 ? false : true,
                                    // onChanged: (value) {
                                    //   controller.cidade.text = value;
                                    // },
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(250),
                                    ],
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    onEditingComplete: node.nextFocus,
                                    controller: controller.cidade,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Insira uma cidade válida';
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Cidade',
                                      border: UnderlineInputBorder(),
                                      prefixIcon: Icon(
                                        Icons.location_city,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 2,
                                child: Observer(builder: (_) {
                                  return TextFormField(
                                    enabled:
                                        controller.entrega == 1 ? false : true,
                                    // onChanged: (value) {
                                    //   controller.uf.text = value;
                                    // },
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    onEditingComplete: node.nextFocus,
                                    controller: controller.uf,
                                    inputFormatters: [
                                      FilteringTextInputFormatter
                                          .singleLineFormatter,
                                      LengthLimitingTextInputFormatter(2),
                                    ],
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Insira um UF válido';
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Estado',
                                      border: UnderlineInputBorder(),
                                      prefixIcon: Icon(
                                        Icons.business,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: kDefaultPadding * 0.5,
                          ),
                          Observer(builder: (_) {
                            return TextFormField(
                              enabled: controller.entrega == 1 ? false : true,
                              // onChanged: (value) {
                              //   controller.cep.text = value;
                              // },
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              textCapitalization: TextCapitalization.words,
                              onEditingComplete: node.unfocus,
                              controller: controller.cep,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                CepInputFormatter(),
                              ],
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Insira um CEP válido';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'CEP',
                                border: UnderlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.location_on,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "Cancelar",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text(
                  "Alterar",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.white,
                      ),
                ),
                onPressed: () {
                  controller.isPageValid();

                  if (controller.pageValid == true) {
                    controller.atualizaDados();
                    Navigator.of(context).pop();
                  } else
                    print("form invalido");
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future buildRetirarLocal(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alterar Endereço"),
          content: Scrollbar(
            controller: scrollController,
            radius: Radius.circular(10),
            thickness: 2,
            isAlwaysShown: true,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Observer(builder: (_) {
                return Form(
                  child: FocusScope(
                    node: node,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      // shrinkWrap: true,
                      // physics: BouncingScrollPhysics(),
                      children: [
                        Observer(builder: (_) {
                          return TextFormField(
                            enabled: false,
                            keyboardType: TextInputType.streetAddress,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.words,
                            onEditingComplete: node.nextFocus,
                            controller: controller.endereco,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Insira um endereço válido';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Endereço',
                              border: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.apartment,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }),
                        SizedBox(
                          height: kDefaultPadding * 0.5,
                        ),
                        Observer(builder: (_) {
                          return TextFormField(
                            enabled: false,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: node.nextFocus,
                            controller: controller.numero,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(5),
                            ],
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Insira um número válido';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Número',
                              border: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.filter_1,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }),
                        SizedBox(
                          height: kDefaultPadding * 0.5,
                        ),
                        Observer(builder: (_) {
                          return TextFormField(
                            enabled: false,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: node.nextFocus,
                            controller: controller.complemento,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(250),
                            ],
                            decoration: InputDecoration(
                              labelText: 'Complemento',
                              border: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.house,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }),
                        SizedBox(
                          height: kDefaultPadding * 0.5,
                        ),
                        Observer(builder: (_) {
                          return TextFormField(
                            enabled: false,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.words,
                            onEditingComplete: node.nextFocus,
                            controller: controller.bairro,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Insira um bairro válido';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Bairro',
                              border: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.house_siding,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }),
                        SizedBox(
                          height: kDefaultPadding * 0.5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Observer(builder: (_) {
                                return TextFormField(
                                  enabled: false,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(250),
                                  ],
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  textCapitalization: TextCapitalization.words,
                                  onEditingComplete: node.nextFocus,
                                  controller: controller.cidade,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Insira uma cidade válida';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Cidade',
                                    border: UnderlineInputBorder(),
                                    prefixIcon: Icon(
                                      Icons.location_city,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                );
                              }),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 2,
                              child: Observer(builder: (_) {
                                return TextFormField(
                                  enabled: false,
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  onEditingComplete: node.nextFocus,
                                  controller: controller.uf,
                                  inputFormatters: [
                                    FilteringTextInputFormatter
                                        .singleLineFormatter,
                                    LengthLimitingTextInputFormatter(2),
                                  ],
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Insira um UF válido';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Estado',
                                    border: UnderlineInputBorder(),
                                    prefixIcon: Icon(
                                      Icons.business,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: kDefaultPadding * 0.5,
                        ),
                        Observer(builder: (_) {
                          return TextFormField(
                            enabled: false,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            textCapitalization: TextCapitalization.words,
                            onEditingComplete: node.unfocus,
                            controller: controller.cep,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              CepInputFormatter(),
                            ],
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Insira um CEP válido';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'CEP',
                              border: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.location_on,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "Fechar",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
