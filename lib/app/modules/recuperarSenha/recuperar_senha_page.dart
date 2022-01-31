import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:prossumidor_v2/app/modules/recuperarSenha/widgets/page1.dart';
import 'package:prossumidor_v2/app/modules/recuperarSenha/widgets/page3.dart';
import '../../components/button.dart';
import '../../constants.dart';
import 'recuperar_senha_controller.dart';
import 'widgets/page2.dart';

class RecuperarSenhaPage extends StatefulWidget {
  final String title;
  const RecuperarSenhaPage({Key key, this.title = "Recuperar Senha"})
      : super(key: key);

  @override
  _RecuperarSenhaPageState createState() => _RecuperarSenhaPageState();
}

class _RecuperarSenhaPageState
    extends ModularState<RecuperarSenhaPage, RecuperarSenhaController> {
  ProgressDialog progressDialog;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    progressDialog = ProgressDialog(context, type: ProgressDialogType.Normal);
    progressDialog.style(
      message: "Carregando...",
      backgroundColor: Colors.white,
      borderRadius: 5.0,
      progressWidget: Padding(
        padding: EdgeInsets.all(15.0),
        child: CircularProgressIndicator(),
      ),
    );
    var appBar = AppBar(
      brightness: Brightness.light,
      leading: IconButton(
        splashRadius: 2,
        icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
        onPressed: () => Modular.to.pushReplacementNamed("/login"),
      ),
      backgroundColor: Colors.white,
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontSize: 20,
            ),
      ),
    );
    var screenHeigh = (size.height - appBar.preferredSize.height) -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          height: screenHeigh,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                height: MediaQuery.of(context).size.height * 0.20,
                image: AssetImage("assets/images/recuperarSenha01.png"),
              ),
              Expanded(
                child: Observer(
                  builder: (_) {
                    return CarouselSlider(
                      carouselController: controller.buttonCarouselController,
                      options: CarouselOptions(
                        height: double.infinity,
                        scrollPhysics: NeverScrollableScrollPhysics(),
                        initialPage: 0,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) =>
                            controller.setIndex(index),
                      ),
                      items: [
                        RecuperarSenhaPage1(),
                        RecuperarSenhaPage2(),
                        RecuperarSenhaPage3(),
                      ].map((widget) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Padding(
                              padding: EdgeInsets.only(
                                top: 5.0,
                                bottom: 5.0,
                              ),
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
                                child: Center(
                                  child: widget,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [0, 1, 2].map((i) {
                  return Observer(builder: (_) {
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.current == i
                            ? Theme.of(context).primaryColor
                            : returnColorIndex(i),
                      ),
                    );
                  });
                }).toList(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Observer(builder: (_) {
                      return ButtonTheme(
                        minWidth: 120.0,
                        height: 40,
                        child: StandardButton(
                          onPressed: () {
                            if (controller.current != 0)
                              controller.setPreviousPage();
                            else
                              Modular.to.pop();
                          },
                          text: controller.current == 0 ? 'Cancelar' : 'Voltar',
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      );
                    }),
                    Observer(builder: (_) {
                      return ButtonTheme(
                        minWidth: 120.0,
                        height: 40,
                        child: StandardButton(
                          onPressed: () async {
                            if (controller.current == 0) {
                              await controller.setNextPage(progressDialog);
                              if (controller.page1Valid) {
                                Future.delayed(Duration(seconds: 3), () {
                                  if (!controller.emailValido)
                                    buildShowGeneralDialog(
                                      context,
                                      'Erro',
                                      'E-mail não cadastrado ou erro de conexão',
                                    );
                                });
                              }
                            } else if (controller.current == 1) {
                              await controller.setNextPage(progressDialog);
                              Future.delayed(Duration(seconds: 3), () {
                                if (!controller.codigoValido)
                                  buildShowGeneralDialog(
                                    context,
                                    'Erro',
                                    'Código inserido não corresponde ao código enviado no seu e-mail.',
                                  );
                              });
                            } else {
                              controller.isPage3Valid();
                              if (controller.page3Valid) {
                                progressDialog.style(message: "Alterando..");
                                progressDialog.show();
                                var res = await controller.alterarNovaSenha();
                                Future.delayed(Duration(seconds: 3), () {
                                  progressDialog.hide();
                                  if (res == "sucesso") {
                                    buildShowGeneralDialog(
                                      context,
                                      'Senha Alterada com Sucesso',
                                      'Sua nova senha foi alterada, efetue o login',
                                    );
                                  } else {
                                    buildShowGeneralDialog(
                                      context,
                                      'Erro ao Alterar Senha',
                                      'Ocorreu um erro na alteração de senha, verifique sua conexão e tente novamente.',
                                    );
                                  }
                                });
                              }
                            }
                          },
                          text:
                              controller.current == 2 ? 'Concluir' : 'Próximo',
                          color: Theme.of(context).primaryColor,
                        ),
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future buildShowGeneralDialog(
      BuildContext context, String titulo, String mensagem) {
    Future.delayed(Duration(seconds: 2), () {
      if (titulo == "Senha Alterada com Sucesso")
        Modular.to.pushNamedAndRemoveUntil('/login', ModalRoute.withName('/'));
    });
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
      height: MediaQuery.of(context).size.height * .3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Spacer(
            flex: 1,
          ),
          Text(
            titulo,
            textAlign: TextAlign.center,
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

  Color returnColorIndex(int i) {
    Color color = Theme.of(context).textSelectionColor.withOpacity(.2);
    switch (i) {
      case 0:
        return controller.page1Valid
            ? Theme.of(context).colorScheme.secondary
            : Colors.grey;
        break;
      case 1:
        return controller.page2Valid
            ? Theme.of(context).colorScheme.secondary
            : Colors.grey;
        break;
      case 2:
        return controller.page3Valid
            ? Theme.of(context).colorScheme.secondary
            : Colors.grey;
        break;
      default:
        break;
    }
    return color;
  }
}
