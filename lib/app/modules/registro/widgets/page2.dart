import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                onChanged: (value) => controller.setEndereco(value),
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
                  hintText: 'Endereço',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: TextFormField(
                onChanged: (value) => controller.setNumero(value),
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
                  hintText: 'Número',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: TextFormField(
                onChanged: (value) => controller.setComplemento(value),
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
                  hintText: 'Complemento',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: TextFormField(
                onChanged: (value) => controller.setBairro(value),
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
                  hintText: 'Bairro',
                ),
              ),
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
                    child: TextFormField(
                      onChanged: (value) => controller.setCidade(value),
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
                        hintText: 'Cidade',
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
                    padding: EdgeInsets.only(right: kDefaultPadding),
                    child: TextFormField(
                      onChanged: (value) => controller.setUF(value),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.sentences,
                      onEditingComplete: node.nextFocus,
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
                        hintText: 'UF',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: TextFormField(
                onChanged: (value) => controller.setCEP(value),
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
                  border: UnderlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.location_on,
                    color: Theme.of(context).primaryColor,
                  ),
                  hintText: 'CEP',
                ),
              ),
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
