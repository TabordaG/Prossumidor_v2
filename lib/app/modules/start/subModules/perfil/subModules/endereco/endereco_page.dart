import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/app_controller.dart';
import 'package:prossumidor_v2/app/components/button.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'endereco_controller.dart';

class EnderecoPage extends StatefulWidget {
  final String title;
  const EnderecoPage({this.title = "Endereco"});

  @override
  _EnderecoPageState createState() => _EnderecoPageState();
}

class _EnderecoPageState
    extends ModularState<EnderecoPage, EnderecoController> {
  final EnderecoController controller = Modular.get<EnderecoController>();
  final AppController appController = Modular.get<AppController>();
  final FocusScopeNode node = FocusScopeNode();

  @override
  void dispose() {
    node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_on, color: Colors.white),
            SizedBox(
              width: kDefaultPadding * 0.25,
            ),
            Text("Endereço"),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.fromLTRB(kDefaultPadding, kDefaultPadding,
                kDefaultPadding, kDefaultPadding * 0.5),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 1,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Observer(builder: (_) {
                return Form(
                  key: controller.formkeyPage,
                  child: FocusScope(
                    node: node,
                    child: ListView(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Text(
                            "Dados de Entrega",
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      fontSize: 18,
                                    ),
                          ),
                        ),
                        SizedBox(
                          height: kDefaultPadding * 0.25,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          child: Observer(builder: (_) {
                            return TextFormField(
                              controller: controller.endereco,
                              keyboardType: TextInputType.streetAddress,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.words,
                              onEditingComplete: node.nextFocus,
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
                        ),
                        SizedBox(
                          height: kDefaultPadding * 0.5,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          child: Observer(builder: (_) {
                            return TextFormField(
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
                        ),
                        SizedBox(
                          height: kDefaultPadding * 0.5,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          child: Observer(builder: (_) {
                            return TextFormField(
                              controller: controller.complemento,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: node.nextFocus,
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
                        ),
                        SizedBox(
                          height: kDefaultPadding * 0.5,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          child: Observer(builder: (_) {
                            return TextFormField(
                              controller: controller.bairro,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.words,
                              onEditingComplete: node.nextFocus,
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
                        ),
                        SizedBox(
                          height: kDefaultPadding * 0.5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.only(left: kDefaultPadding),
                                child: Observer(builder: (_) {
                                  return TextFormField(
                                    controller: controller.cidade,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(250),
                                    ],
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    onEditingComplete: node.nextFocus,
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
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(right: kDefaultPadding),
                                child: Observer(builder: (_) {
                                  return TextFormField(
                                    controller: controller.uf,
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    onEditingComplete: node.nextFocus,
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
                                      labelText: 'UF',
                                      border: UnderlineInputBorder(),
                                      prefixIcon: Icon(
                                        Icons.business,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: kDefaultPadding * 0.5,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          child: Observer(builder: (_) {
                            return TextFormField(
                              controller: controller.cep,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              textCapitalization: TextCapitalization.words,
                              onEditingComplete: node.unfocus,
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
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: kDefaultPadding,
                              right: kDefaultPadding,
                              top: kDefaultPadding),
                          child: Container(
                            height: 65,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: kDefaultPadding * 2.5),
                                  child: Text('Local de Retirada'),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: kDefaultPadding * 0.7),
                                      child: Icon(Icons.local_shipping_rounded,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: kDefaultPadding * 0.5),
                                        child: Observer(builder: (_) {
                                          return DropdownButton<String>(
                                            isExpanded: true,
                                            value: controller.dropdownvalue,
                                            //icon: const Icon(Icons.arrow_downward),
                                            //iconSize: 24,
                                            elevation: 16,
                                            underline: Container(
                                              height: 2,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                            ),
                                            onChanged: (String newValue) {
                                              setState(() {
                                                controller
                                                    .mudaDropDown(newValue);
                                              });
                                            },
                                            items: controller.listLocalRetirada
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          );
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: kDefaultPadding * 2,
                              vertical: kDefaultPadding * 0.5),
                          child: ButtonTheme(
                            minWidth: 150,
                            height: 40,
                            child: StandardButton(
                              onPressed: () async {
                                controller.isPageValid();
                                if (controller.pageValid == true) {
                                  String response =
                                      await controller.atualizaDados();
                                  print(response);
                                  if (response != null) {
                                    buildShowDialog(context, response);
                                    Navigator.of(context).pop();
                                  } else
                                    buildShowDialog(context, response);
                                } else
                                  print("form invalido");
                              },
                              color: Theme.of(context).primaryColor,
                              text: "Alterar dados",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Future buildShowDialog(BuildContext context, String response) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alteração de Dados', textAlign: TextAlign.center),
            content: Container(
              height: 75,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(kDefaultPadding * 0.25),
                    child: Icon(
                        response == 'sucesso' ? Icons.check : Icons.clear,
                        color: kPrimaryColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(kDefaultPadding * 0.25),
                    child: Text(
                      response == 'sucesso'
                          ? 'Dados Alterados com Sucesso'
                          : 'Houve um erro, por favor tente de novo!',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 14,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
