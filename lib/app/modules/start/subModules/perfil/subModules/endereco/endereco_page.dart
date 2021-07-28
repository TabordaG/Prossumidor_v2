import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/components/button.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'endereco_controller.dart';

class EnderecoPage extends StatefulWidget {
  final String title;
  const EnderecoPage({Key key, this.title = "Endereco"}) : super(key: key);

  @override
  _EnderecoPageState createState() => _EnderecoPageState();
}

class _EnderecoPageState
    extends ModularState<EnderecoPage, EnderecoController> {
  final EnderecoController controller = Modular.get<EnderecoController>();
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
                          child: TextFormField(
                            onChanged: (value) {
                              controller.endereco.text = value;
                            },
                            keyboardType: TextInputType.streetAddress,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.words,
                            onEditingComplete: node.nextFocus,
                            initialValue: controller.endereco.text,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Insira um endereço válido';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.apartment,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: kDefaultPadding * 0.5,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          child: TextFormField(
                            onChanged: (value) {
                              controller.numero.text = value;
                            },
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: node.nextFocus,
                            initialValue: controller.numero.text,
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
                              border: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.filter_1,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: kDefaultPadding * 0.5,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          child: TextFormField(
                            onChanged: (value) {
                              controller.complemento.text = value;
                            },
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: node.nextFocus,
                            initialValue: controller.complemento.text,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(250),
                            ],
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.house,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: kDefaultPadding * 0.5,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          child: TextFormField(
                            onChanged: (value) {
                              controller.bairro.text = value;
                            },
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.words,
                            onEditingComplete: node.nextFocus,
                            initialValue: controller.bairro.text,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Insira um bairro válido';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.house_siding,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
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
                                child: TextFormField(
                                  onChanged: (value) {
                                    controller.cidade.text = value;
                                  },
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(250),
                                  ],
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  textCapitalization: TextCapitalization.words,
                                  onEditingComplete: node.nextFocus,
                                  initialValue: controller.cidade.text,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Insira uma cidade válida';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    prefixIcon: Icon(
                                      Icons.location_city,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
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
                                child: TextFormField(
                                  onChanged: (value) {
                                    controller.uf.text = value;
                                  },
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  onEditingComplete: node.nextFocus,
                                  initialValue: controller.uf.text,
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
                                    border: UnderlineInputBorder(),
                                    prefixIcon: Icon(
                                      Icons.business,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
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
                          child: TextFormField(
                            onChanged: (value) {
                              controller.cep.text = value;
                            },
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            textCapitalization: TextCapitalization.words,
                            onEditingComplete: node.unfocus,
                            initialValue: controller.cep.text,
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
                              border: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.location_on,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: kDefaultPadding,
                              vertical: kDefaultPadding * 0.5),
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: kDefaultPadding * 0.7),
                                  child: Icon(Icons.local_shipping_rounded,
                                      color: Theme.of(context).primaryColor),
                                ),
                                Observer(builder: (_) {
                                  return Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: kDefaultPadding * 0.5),
                                      child: DropdownButton<String>(
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
                                            controller.mudaDropDown(newValue);
                                          });
                                        },
                                        items: centroDistribuicao
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  );
                                }),
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
                              onPressed: () {
                                controller.isPageValid();
                                if (controller.pageValid == true) {
                                  controller.atualizaDados();
                                  Navigator.of(context).pop();
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
}
