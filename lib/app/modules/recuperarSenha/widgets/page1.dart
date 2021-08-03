import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../constants.dart';
import '../recuperar_senha_controller.dart';

class RecuperarSenhaPage1 extends StatefulWidget {
  const RecuperarSenhaPage1({Key key}) : super(key: key);

  @override
  _RecuperarSenhaPage1State createState() => _RecuperarSenhaPage1State();
}

class _RecuperarSenhaPage1State extends State<RecuperarSenhaPage1> {
  final RecuperarSenhaController controller =
      Modular.get<RecuperarSenhaController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formkeyPage1,
      child: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          Text(
            'Informe seu e-mail para recuperar senha',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: 18,
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: TextFormField(
              controller: controller.email,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              textCapitalization: TextCapitalization.none,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Insira um endereço de email';
                } else {
                  if (value.length < 3) {
                    return "Email Tem Que Ter Pelo Menos 3 Caracteres";
                  } else {
                    Pattern pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex = new RegExp(pattern);
                    if (!regex.hasMatch(value)) {
                      return 'Insira um endereço de email válido';
                    } else
                      return null;
                  }
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
            height: 40,
          ),
          Text(
            'Obs.: Será enviado um código de confirmação no seu e-mail. Por favor, verifique sua caixa de entrada',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: 14,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .color
                      .withOpacity(.6),
                ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
