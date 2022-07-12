import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../constants.dart';
import '../registro_controller.dart';

class RegistrarPage3 extends StatefulWidget {
  const RegistrarPage3({Key? key}) : super(key: key);

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
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                'Dados da Conta',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 18,
                    ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Observer(builder: (_) {
                return TextFormField(
                  controller: controller.email,
                  // textCapitalization: TextCapitalization.words,
                  onEditingComplete: node.nextFocus,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Insira um endereço de email';
                    } else {
                      if (value.length < 3) {
                        return "Email Tem Que Ter Pelo Menos 3 Caracteres";
                      } else {
                        String pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regex = RegExp(pattern);
                        if (!regex.hasMatch(value)) {
                          return 'Insira um endereço de email válido';
                        } else {
                          return null;
                        }
                      }
                    }
                  },
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Theme.of(context).primaryColor,
                    ),
                    labelText: 'E-mail',
                  ),
                );
              }),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
              child: Row(
                children: [
                  Icon(
                    Icons.business_center,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
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
                                  .bodyText1!
                                  .copyWith(
                                    color: dropDownStringItem ==
                                            'Local de Retirada'
                                        ? Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color!
                                            .withOpacity(.6)
                                        : Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color,
                                  ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? novoItemSelecionado) {
                          if (novoItemSelecionado != 'Local de Retirada') {
                            setState(() {
                              novoItemSelecionado != null
                                  ? {
                                      controller
                                          .setRetirada(novoItemSelecionado),
                                      controller
                                          .setRetiradaID(novoItemSelecionado),
                                    }
                                  : null;
                            });
                          }
                        },
                        value: controller.retirada,
                      ),
                    );
                  }),
                ],
              ),
            ),
            Observer(builder: (_) {
              return controller.isRetirada
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Text(
                        'Por favor, selecione um local de retirada',
                        style: TextStyle(color: Colors.red[700], fontSize: 12),
                      ),
                    );
            }),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Observer(builder: (_) {
                return TextFormField(
                  controller: controller.senha,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: node.unfocus,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Insira uma senha válida';
                    } else if (value.length < 6) {
                      return 'A senha deve ter no mínimo 6 caracteres.';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Theme.of(context).primaryColor,
                    ),
                    labelText: 'Senha',
                  ),
                );
              }),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onEditingComplete: node.unfocus,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo não pode estar vazio';
                  } else if (value != controller.senha.text) {
                    return 'Senhas não coincidem';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Theme.of(context).primaryColor,
                  ),
                  labelText: 'Confirmar Senha',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
