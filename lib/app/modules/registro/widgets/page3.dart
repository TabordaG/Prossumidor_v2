import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../constants.dart';
import '../registro_controller.dart';

class RegistrarPage3 extends StatefulWidget {
  const RegistrarPage3({Key key}) : super(key: key);

  @override
  _RegistrarPage3State createState() => _RegistrarPage3State();
}

class _RegistrarPage3State extends State<RegistrarPage3> {
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
      key: controller.formkeyPage3,
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
                'Dados da Conta',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: 18,
                    ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: TextFormField(
                onChanged: (value) => controller.setEmail(value),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                onEditingComplete: node.nextFocus,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Insira um e-mail válido';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Theme.of(context).primaryColor,
                  ),
                  hintText: 'E-mail',
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
              child: Row(
                children: [
                  Icon(
                    Icons.business_center,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Observer(builder: (_) {
                    return Expanded(
                      child: DropdownButton<String>(
                        items: controller.locaisRetiradaNomes
                            // ['Local de Retirada', 'Recoopsol', 'Rondonópolis']
                            .map((dynamic dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(
                              dropDownStringItem,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    color: dropDownStringItem ==
                                            'Local de Retirada'
                                        ? Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .color
                                            .withOpacity(.6)
                                        : Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .color,
                                  ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String novoItemSelecionado) {
                          if (novoItemSelecionado != 'Local de Retirada')
                            setState(() {
                              controller.setRetirada(novoItemSelecionado);
                            });
                        },
                        value: controller.retirada,
                      ),
                    );
                  }),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: TextFormField(
                onChanged: (value) => controller.setSenha(value),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onEditingComplete: node.unfocus,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Insira uma senha válida';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Theme.of(context).primaryColor,
                  ),
                  hintText: 'Senha',
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: TextFormField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onEditingComplete: node.unfocus,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo não pode estar vazio';
                  } else if (value != controller.senha) {
                    return 'Senhas não coincidem';
                  } else
                    return null;
                },
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Theme.of(context).primaryColor,
                  ),
                  hintText: 'Confirmar Senha',
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
