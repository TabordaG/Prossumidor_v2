import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../constants.dart';
import '../recuperar_senha_controller.dart';

class RecuperarSenhaPage2 extends StatefulWidget {
  const RecuperarSenhaPage2({Key? key}) : super(key: key);

  @override
  _RecuperarSenhaPage2State createState() => _RecuperarSenhaPage2State();
}

class _RecuperarSenhaPage2State extends State<RecuperarSenhaPage2> {
  final RecuperarSenhaController controller =
      Modular.get<RecuperarSenhaController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formkeyPage2,
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Text(
            'Preencha com o código de segurança',
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
            child: TextFormField(
              controller: controller.code,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              textCapitalization: TextCapitalization.none,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4),
              ],
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Insira o código de recuperação';
                } else {
                  if (value.length < 4) {
                    return "Insira um código de recuperação válido";
                  } else {
                    return null;
                  }
                }
              },
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                prefixIcon: Icon(
                  Icons.code,
                  color: Theme.of(context).primaryColor,
                ),
                hintText: 'Código',
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Insira o código',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 12,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withOpacity(.8),
                ),
          ),
          const SizedBox(
            height: 40,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 14,
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .color!
                        .withOpacity(.6),
                  ),
              children: [
                const TextSpan(text: 'Se não recebeu, '),
                TextSpan(
                  text: 'clique aqui ',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 14,
                        color: Theme.of(context).primaryColor,
                      ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      controller.reenviarRecuperacao();
                      controller.confirmaReenvio
                          ? AlertDialog(
                              shape: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              content:
                                  buildMensage(context, "titulo", "mensagem"),
                            )
                          : Container();
                    },
                ),
                const TextSpan(text: '\npara enviar novamente'),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  SizedBox buildMensage(BuildContext context, String titulo, String mensagem) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(
            flex: 1,
          ),
          Text(
            titulo,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 22,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withOpacity(.8),
                ),
          ),
          const Spacer(
            flex: 2,
          ),
          Text(
            mensagem,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 16,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withOpacity(.6),
                ),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
