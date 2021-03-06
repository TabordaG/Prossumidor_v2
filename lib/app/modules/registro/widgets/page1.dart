import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/modules/registro/registro_controller.dart';

import '../../../constants.dart';

class RegistrarPage1 extends StatefulWidget {
  const RegistrarPage1({Key? key}) : super(key: key);

  @override
  _RegistrarPage1State createState() => _RegistrarPage1State();
}

class _RegistrarPage1State extends State<RegistrarPage1> {
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
      key: controller.formkeyPage1,
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
                'Dados Pessoais',
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
                  controller: controller.nome,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  onEditingComplete: node.nextFocus,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Insira um nome válido';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Theme.of(context).primaryColor,
                    ),
                    labelText: 'Nome',
                  ),
                );
              }),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Observer(builder: (_) {
                return TextFormField(
                  controller: controller.cpf,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: node.nextFocus,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Insira seu CPF';
                    } else {
                      String pattern =
                          r'^(([0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[\.]?[0-9]{3}[\.]?[0-9]{3}[-]?[0-9]{2}))$';
                      RegExp regex = RegExp(pattern);
                      if (!regex.hasMatch(value)) {
                        return 'Insira um CPF válido';
                      } else {
                        return null;
                      }
                    }
                  },
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.contact_page,
                      color: Theme.of(context).primaryColor,
                    ),
                    labelText: 'CPF',
                  ),
                );
              }),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Observer(builder: (_) {
                return TextFormField(
                  controller: controller.telefone,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  onEditingComplete: node.unfocus,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter()
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Insira um telefone válido';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Theme.of(context).primaryColor,
                    ),
                    labelText: 'Telefone',
                  ),
                );
              }),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 0,
                  activeColor: Theme.of(context).primaryColor,
                  groupValue: controller.genero,
                  onChanged: (value) {
                    setState(() {
                      controller.setGenero(value as int);
                    });
                  },
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      controller.setGenero(0);
                    });
                  },
                  child: Text(
                    'Masculino',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color!
                              .withOpacity(.8),
                        ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Radio(
                  value: 1,
                  activeColor: Theme.of(context).primaryColor,
                  groupValue: controller.genero,
                  onChanged: (value) {
                    setState(() {
                      controller.setGenero(value as int);
                    });
                  },
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      controller.setGenero(1);
                    });
                  },
                  child: Text(
                    'Feminino',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color!
                              .withOpacity(.8),
                        ),
                  ),
                ),
              ],
            ),
            Observer(builder: (_) {
              return controller.generoValid
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Text(
                        'Por favor, selecione um gênero.',
                        style: TextStyle(color: Colors.red[700], fontSize: 12),
                      ),
                    );
            }),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //children: [
            //     Radio(
            //       value: 2,
            //       activeColor: Theme.of(context).primaryColor,
            //       groupValue: controller.genero,
            //       onChanged: (value) {
            //         setState(() {
            //           controller.setGenero(value);
            //         });
            //       },
            //     ),
            //     InkWell(
            //       onTap: () {
            //         setState(() {
            //           controller.setGenero(2);
            //         });
            //       },
            //       child: Text(
            //         'Outro',
            //         style: Theme.of(context).textTheme.bodyText1.copyWith(
            //               color: Theme.of(context)
            //                   .textTheme
            //                   .bodyText1
            //                   .color
            //                   .withOpacity(.8),
            //             ),
            //       ),
            //     ),
            //     // SizedBox(
            //     //   width: 10,
            //     // ),
            //     // Container(
            //     //   width: 100,
            //     //   child: TextField(
            //     //     enabled: controller.genero == 2 ? true : false,
            //     //     onChanged: (value) => controller.setGeneroOutro(value),
            //     //     keyboardType: TextInputType.emailAddress,
            //     //     textInputAction: TextInputAction.done,
            //     //     textCapitalization: TextCapitalization.words,
            //     //     decoration: InputDecoration(
            //     //       isDense: true,
            //     //       border: UnderlineInputBorder(),
            //     //     ),
            //     //   ),
            //     // ),
            //   ],
            // ),
            // SizedBox(
            //   height: 10,
            // ),
          ],
        ),
      ),
    );
  }
}
