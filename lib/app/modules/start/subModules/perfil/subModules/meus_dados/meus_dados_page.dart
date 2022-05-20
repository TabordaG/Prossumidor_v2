import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/components/button.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'meus_dados_controller.dart';

class MeusDadosPage extends StatefulWidget {
  final String title;
  const MeusDadosPage({Key? key, this.title = "MeusDados"}) : super(key: key);

  @override
  _MeusDadosPageState createState() => _MeusDadosPageState();
}

class _MeusDadosPageState
    extends ModularState<MeusDadosPage, MeusDadosController> {
  @override
  final MeusDadosController controller = Modular.get<MeusDadosController>();
  final FocusScopeNode node = FocusScopeNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.person),
            SizedBox(width: kDefaultPadding * 0.25),
            Text("Meus dados")
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: kDefaultPadding, horizontal: kDefaultPadding),
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
                      offset: const Offset(0, 0),
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
                        physics: const BouncingScrollPhysics(),
                        children: [
                          const SizedBox(
                            height: kDefaultPadding * 0.5,
                          ),
                          Center(
                            child: Text(
                              "Dados Pessoais",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 18,
                                  ),
                            ),
                          ),
                          const SizedBox(
                            height: kDefaultPadding * 0.20,
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child: TextFormField(
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
                                  labelText: 'Nome',
                                  border: const UnderlineInputBorder(),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: kDefaultPadding * 0.5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            child: TextFormField(
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
                                labelText: 'CPF',
                                border: const UnderlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.contact_page,
                                  color: Theme.of(context).primaryColor,
                                ),
                                hintText:
                                    controller.cpf.text.isEmpty ? "CPF" : null,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: kDefaultPadding * 0.5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            child: TextFormField(
                              controller: controller.celular,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
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
                                labelText: 'Telefone',
                                border: const UnderlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Theme.of(context).primaryColor,
                                ),
                                hintText: controller.celular.text.isEmpty
                                    ? "Telefone"
                                    : null,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.all(kDefaultPadding * 0.5),
                            child: Observer(builder: (_) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.setGenero(0);
                                    },
                                    child: Text(
                                      'Masculino',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .color!
                                                .withOpacity(.8),
                                          ),
                                    ),
                                  ),
                                  Radio(
                                    value: 0,
                                    activeColor: Theme.of(context).primaryColor,
                                    groupValue: controller.generoId,
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .color!
                                                .withOpacity(.8),
                                          ),
                                    ),
                                  ),
                                  Radio(
                                    value: 1,
                                    activeColor: Theme.of(context).primaryColor,
                                    groupValue: controller.generoId,
                                    onChanged: (value) {
                                      setState(() {
                                        controller.setGenero(value as int);
                                      });
                                    },
                                  ),
                                ],
                              );
                            }),
                          ),
                          const SizedBox(
                            height: kDefaultPadding * 0.10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            child: TextFormField(
                              controller: controller.dataNascimento,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.words,
                              onEditingComplete: node.nextFocus,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                DataInputFormatter(),
                              ],
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Insira uma data de nascimento válida';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: 'Data de Nascimento',
                                  border: const UnderlineInputBorder(),
                                  prefixIcon: Icon(
                                    Icons.house_siding,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  hintText:
                                      controller.dataNascimento.text.isEmpty
                                          ? "Data de nascimento"
                                          : null),
                            ),
                          ),
                          const SizedBox(
                            height: kDefaultPadding * 0.5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: kDefaultPadding,
                                right: kDefaultPadding,
                                top: kDefaultPadding),
                            child: SizedBox(
                              height: 80,
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: kDefaultPadding * 2.5),
                                    child: Text('Estado Civil'),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: kDefaultPadding * 0.7),
                                        child: Icon(Icons.family_restroom,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: kDefaultPadding * 0.5),
                                          child: Observer(builder: (_) {
                                            return DropdownButton<String>(
                                              isExpanded: true,
                                              value: controller.estadoCivil,
                                              //icon: const Icon(Icons.arrow_downward),
                                              //iconSize: 24,
                                              elevation: 16,
                                              underline: Container(
                                                height: 2,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  controller
                                                      .mudaDropDown(newValue!);
                                                });
                                              },
                                              items: controller.listEstadoCivil
                                                  .map<
                                                          DropdownMenuItem<
                                                              String>>(
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding * 2,
                                vertical: kDefaultPadding * 0.25),
                            child: ButtonTheme(
                              minWidth: 150,
                              height: 40,
                              child: StandardButton(
                                onPressed: () async {
                                  controller.isPageValid();
                                  if (controller.pageValid == true) {
                                    String response =
                                        await controller.atualizaDados();
                                    if (response != null) {
                                      buildShowDialog(context, response);
                                      Navigator.of(context).pop();
                                    } else {
                                      buildShowDialog(context, response);
                                    }
                                  } else {}
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
                })),
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
            title:
                const Text('Alteração de Dados', textAlign: TextAlign.center),
            content: SizedBox(
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
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
