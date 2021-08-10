import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/components/button.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  final GlobalKey<FormState> formkey = new GlobalKey<FormState>();
  final AuthController authController = Modular.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: size.height * .4,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(kDefaultPadding * 2),
                      child: Hero(
                        tag: 'LogoSplash',
                        child: Image(
                          image: AssetImage("assets/images/newLogo_2.png"),
                        ),
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 4,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: TextFormField(
                      onChanged: (value) => controller.setEmail(value),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
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
                  Spacer(
                    flex: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Observer(builder: (_) {
                      return TextFormField(
                        obscureText: controller.obscureSenha,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (value) async {
                          if (formkey.currentState.validate()) {
                            int response = await controller.verificaLogin();
                            switch (response) {
                              case 0:
                                await authController
                                    .addStringToSF(controller.email);
                                Modular.to.pushReplacementNamed('/start');
                                break;
                              case 1:
                                buildShowGeneralDialog(
                                    context, "Erro de Login", 'Senha Inválida');
                                break;
                              case 2:
                                buildShowGeneralDialog(context, "Erro de Login",
                                    'E-mail Inválido');
                                break;
                              case 3:
                                buildShowGeneralDialog(context, "Erro de Login",
                                    'Seu usuário ainda não foi validado. Um e-mail foi enviado para sua caixa de entrada, verifique para confirmar seu cadastro.');
                                break;
                              default:
                            }
                          }
                        },
                        onChanged: (value) => controller.setSenha(value),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "O campo senha não pode ficar vazio";
                          } else if (value.length < 6) {
                            return "A senha tem que ter pelo menos 6 caracteres";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Theme.of(context).primaryColor,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.obscureSenha
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () => controller
                                .setObscureSenha(!controller.obscureSenha),
                          ),
                          hintText: 'Senha',
                        ),
                      );
                    }),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Modular.to.pushNamed('/recuperarSenha');
                        },
                        child: Text(
                          'Esqueceu a senha ?',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  ButtonTheme(
                    minWidth: size.width * .6,
                    child: StandardButton(
                      onPressed: () async {
                        if (formkey.currentState.validate()) {
                          int response = await controller.verificaLogin();
                          switch (response) {
                            case 0:
                              await authController
                                  .addStringToSF(controller.email);
                              Modular.to.pushReplacementNamed('/start');
                              break;
                            case 1:
                              buildShowGeneralDialog(
                                  context, "Erro de Login", 'Senha Inválida');
                              break;
                            case 2:
                              buildShowGeneralDialog(
                                  context, "Erro de Login", 'E-mail Inválido');
                              break;
                            case 3:
                              buildShowGeneralDialog(context, "Erro de Login",
                                  'Seu usuário ainda não foi validado. Um e-mail foi enviado para sua caixa de entrada, verifique para confirmar seu cadastro.');
                              break;
                            default:
                          }
                        }
                      },
                      color: Theme.of(context).primaryColor,
                      text: 'Entrar',
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            endIndent: kDefaultPadding,
                          ),
                        ),
                        Text(
                          'ou',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                fontSize: 14,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .color
                                    .withOpacity(.8),
                              ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            indent: kDefaultPadding,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    'Não possui conta ainda ?',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 14,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .color
                              .withOpacity(.8),
                        ),
                  ),
                  TextButton(
                    onPressed: () {
                      Modular.to.pushNamed('/registro');
                    },
                    child: Text(
                      'Registar',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Spacer(
                    flex: 4,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future buildShowGeneralDialog(
      BuildContext context, String titulo, String mensagem) {
    return showGeneralDialog(
      barrierLabel: "Mensage",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, anim1, anim2) => null,
      transitionBuilder: (context, a1, a2, child) {
        final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
              shape: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5.0),
              ),
              content: buildMensage(context, titulo, mensagem),
            ),
          ),
        );
      },
    );
  }

  Container buildMensage(BuildContext context, String titulo, String mensagem) {
    return Container(
      height: MediaQuery.of(context).size.height * .1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Spacer(
            flex: 1,
          ),
          Text(
            titulo,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: 22,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .color
                      .withOpacity(.8),
                ),
          ),
          Spacer(
            flex: 2,
          ),
          Text(
            mensagem,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: 16,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .color
                      .withOpacity(.6),
                ),
          ),
          Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
