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
  const MeusDadosPage({Key key, this.title = "MeusDados"}) : super(key: key);

  @override
  _MeusDadosPageState createState() => _MeusDadosPageState();
}

class _MeusDadosPageState
    extends ModularState<MeusDadosPage, MeusDadosController> {
  final MeusDadosController controller = Modular.get<MeusDadosController>();
  final FocusScopeNode node = FocusScopeNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.person),
            SizedBox(width: kDefaultPadding * 0.25),
            Text("Meus dados")
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
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
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Form(
                key: controller.formkeyPage,
                child: FocusScope(
                  node: node,
                  child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: kDefaultPadding * 0.5,
                      ),
                      Center(
                        child: Text(
                          "Dados Pessoais",
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                fontSize: 18,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: kDefaultPadding * 0.20,
                      ),
                      Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          child: TextFormField(
                            controller: controller.nome,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.words,
                            onEditingComplete: node.nextFocus,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Insira um nome válido';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Theme.of(context).primaryColor,
                              ),
                              // hintText:
                              //     controller.nome.text.isEmpty ? "Nome" : null,
                            ),
                          )),
                      SizedBox(
                        height: kDefaultPadding * 0.5,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
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
                            if (value.isEmpty) {
                              return 'Insira seu CPF';
                            } else {
                              Pattern pattern =
                                  r'^(([0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[\.]?[0-9]{3}[\.]?[0-9]{3}[-]?[0-9]{2}))$';
                              RegExp regex = new RegExp(pattern);
                              if (!regex.hasMatch(value)) {
                                return 'Insira um CPF válido';
                              } else {
                                return null;
                              }
                            }
                          },
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.contact_page,
                              color: Theme.of(context).primaryColor,
                            ),
                            hintText:
                                controller.cpf.text.isEmpty ? "CPF" : null,
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
                          controller: controller.telefone,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: node.unfocus,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter()
                          ],
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Insira um telefone válido';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Theme.of(context).primaryColor,
                            ),
                            hintText: controller.telefone.text.isEmpty
                                ? "Telefone"
                                : null,
                          ),
                        ),
                      ),
                      Observer(builder: (_) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.generoId = 0;
                              },
                              child: Text(
                                'Masculino',
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
                            Radio(
                              value: 0,
                              activeColor: Theme.of(context).primaryColor,
                              groupValue: controller.generoId,
                              onChanged: (value) {
                                setState(() {
                                  controller.generoId = value;
                                });
                              },
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  controller.generoId = 1;
                                });
                              },
                              child: Text(
                                'Feminino',
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
                            Radio(
                              value: 1,
                              activeColor: Theme.of(context).primaryColor,
                              groupValue: controller.generoId,
                              onChanged: (value) {
                                setState(() {
                                  controller.generoId = value;
                                });
                              },
                            ),
                          ],
                        );
                      }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                controller.generoId = 2;
                              });
                            },
                            child: Text(
                              'Outro',
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
                          Radio(
                            value: 2,
                            activeColor: Theme.of(context).primaryColor,
                            groupValue: controller.generoId,
                            onChanged: (value) {
                              setState(() {
                                controller.generoId = value;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 100,
                            child: TextFormField(
                              enabled:
                                  controller.genero.text == '2' ? true : false,
                              onChanged: (value) => controller.generoOutro,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.words,
                              initialValue: controller.generoOutro.text,
                              decoration: InputDecoration(
                                isDense: true,
                                border: UnderlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: kDefaultPadding * 0.15,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        child: TextFormField(
                          controller: controller.dataNascimento,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.words,
                          onEditingComplete: node.nextFocus,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Insira uma data de nascimento válida';
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
                              hintText: controller.dataNascimento.text.isEmpty
                                  ? "Data de nascimento"
                                  : null),
                        ),
                      ),
                      SizedBox(
                        height: kDefaultPadding * 0.5,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        child: TextFormField(
                          controller: controller.estadoCivil,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(250),
                          ],
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.words,
                          onEditingComplete: node.nextFocus,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Insira uma estado cívil válida';
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
                            hintText: controller.estadoCivil.text.isEmpty
                                ? "Estado Cívil"
                                : null,
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
                          controller: controller.localRetirada,
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
                              return 'Insira um local válido';
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
                            hintText: controller.localRetirada.text.isEmpty
                                ? "Local de Retirada"
                                : null,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding * 2,
                            vertical: kDefaultPadding),
                        child: ButtonTheme(
                          minWidth: 150,
                          height: 40,
                          child: StandardButton(
                            onPressed: () {
                              controller.isPageValid();
                              if (controller.pageValid == true) {
                                controller.atualizaDados();
                              } else
                                print("formkey invalido");
                            },
                            color: Theme.of(context).primaryColor,
                            text: "Alterar dados",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
