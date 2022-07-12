import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../constants.dart';
import '../recuperar_senha_controller.dart';

class RecuperarSenhaPage3 extends StatefulWidget {
  const RecuperarSenhaPage3({Key? key}) : super(key: key);

  @override
  _RecuperarSenhaPage3State createState() => _RecuperarSenhaPage3State();
}

class _RecuperarSenhaPage3State extends State<RecuperarSenhaPage3> {
  final RecuperarSenhaController controller =
      Modular.get<RecuperarSenhaController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formkeyPage3,
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Text(
            'Insira sua nova senha',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 18,
                ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Observer(builder: (_) {
              return TextFormField(
                obscureText: controller.obscureSenha1,
                textInputAction: TextInputAction.next,
                controller: controller.senha,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "O campo senha não pode ficar vazio";
                  } else if (value.length < 6) {
                    return "A senha tem que ter pelo menos 6 caracteres";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Theme.of(context).primaryColor,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.obscureSenha1
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () =>
                        controller.setObscureSenha1(!controller.obscureSenha1),
                  ),
                  hintText: 'Senha',
                ),
              );
            }),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Observer(builder: (_) {
              return TextFormField(
                obscureText: controller.obscureSenha2,
                textInputAction: TextInputAction.done,
                controller: controller.confirmarSenha,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "O campo confirmar senha não pode ficar vazio";
                  } else if (value != controller.senha.text) {
                    return "Senhas não coincidem";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Theme.of(context).primaryColor,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.obscureSenha2
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () =>
                        controller.setObscureSenha2(!controller.obscureSenha2),
                  ),
                  hintText: 'Confirmar Senha',
                ),
              );
            }),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
