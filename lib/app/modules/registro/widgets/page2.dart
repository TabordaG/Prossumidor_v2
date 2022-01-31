import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../constants.dart';
import '../registro_controller.dart';

class RegistrarPage2 extends StatefulWidget {
  const RegistrarPage2({Key key}) : super(key: key);

  @override
  _RegistrarPage2State createState() => _RegistrarPage2State();
}

class _RegistrarPage2State extends State<RegistrarPage2> {
  final RegistroController controller = Modular.get<RegistroController>();
  final FocusScopeNode node = FocusScopeNode();

  @override
  void dispose() {
    node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formkeyPage2,
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
                'Dados de Entrega',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: 18,
                    ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: TextFormField(
                controller: controller.cep,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                textCapitalization: TextCapitalization.words,
                onEditingComplete: () {
                  controller.buscaCEP();
                  node.unfocus();
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.of(context).pop();
                      });
                      return AlertDialog(
                        content: Observer(builder: (_) {
                          if (controller.responseCEP == "waiting")
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircularProgressIndicator(
                                  strokeWidth: 1,
                                ),
                              ],
                            );
                          else if (controller.responseCEP == "Erro")
                            return Text(
                              "CEP não encontrado",
                              style: TextStyle(
                                color: Colors.black.withOpacity(.7),
                              ),
                              textAlign: TextAlign.center,
                            );
                          else
                            return Text(
                              "Dados Carregados",
                              style: TextStyle(
                                color: Colors.black.withOpacity(.7),
                              ),
                              textAlign: TextAlign.center,
                            );
                        }),
                      );
                    },
                  );
                },
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
                  labelText: 'CEP',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Observer(builder: (_) {
                return TextFormField(
                  // onChanged: (value) => controller.setEndereco(value),
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
                    border: UnderlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.apartment,
                      color: Theme.of(context).primaryColor,
                    ),
                    labelText: 'Endereço',
                  ),
                );
              }),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Observer(builder: (_) {
                return TextFormField(
                  controller: controller.numero,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: node.nextFocus,
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
                    labelText: 'Número',
                  ),
                );
              }),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
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
                    border: UnderlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.house,
                      color: Theme.of(context).primaryColor,
                    ),
                    labelText: 'Complemento',
                  ),
                );
              }),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
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
                    border: UnderlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.house_siding,
                      color: Theme.of(context).primaryColor,
                    ),
                    labelText: 'Bairro',
                  ),
                );
              }),
            ),
            SizedBox(
              height: 10,
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
                        textCapitalization: TextCapitalization.words,
                        onEditingComplete: node.nextFocus,
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
                          labelText: 'Cidade',
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
                    padding: EdgeInsets.only(right: kDefaultPadding),
                    child: Observer(builder: (_) {
                      return TextFormField(
                        controller: controller.uf,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.characters,
                        onEditingComplete: node.unfocus,
                        inputFormatters: [
                          FilteringTextInputFormatter.singleLineFormatter,
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
                          labelText: 'UF',
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
