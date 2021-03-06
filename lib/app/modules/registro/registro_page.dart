import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/components/button.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import '../../components/button.dart';
import '../../constants.dart';
import 'registro_controller.dart';
import 'widgets/page1.dart';
import 'widgets/page2.dart';
import 'widgets/page3.dart';

class RegistroPage extends StatefulWidget {
  final String title;
  const RegistroPage({Key? key, this.title = "Dados Cadastrais"})
      : super(key: key);

  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState
    extends ModularState<RegistroPage, RegistroController> {
  final AuthController authController = Modular.get<AuthController>();
  late ProgressDialog progressDialog;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    progressDialog = ProgressDialog(context: context);
    // progressDialog.style(
    // message: "Carregando...",
    // backgroundColor: Colors.white,
    // borderRadius: 5.0,
    // progressWidget: Padding(
    //   padding: EdgeInsets.all(15.0),
    //   child: CircularProgressIndicator(),
    // ),
    // );
    var appBar = AppBar(
      // brightness: Brightness.light,
      leading: IconButton(
        splashRadius: 2,
        icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
        onPressed: () => Modular.to.pushReplacementNamed("/login"),
      ),
      backgroundColor: Colors.white,
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 20,
            ),
      ),
    );
    var screenHeigh = (size.height - appBar.preferredSize.height) -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeigh,
          width: size.width,
          child: Observer(
            builder: (_) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  controller.current == 0
                      ? Image(
                          height: MediaQuery.of(context).size.height * 0.20,
                          image:
                              const AssetImage("assets/images/registro01.png"),
                        )
                      : controller.current == 2
                          ? Image(
                              height: MediaQuery.of(context).size.height * 0.20,
                              image: const AssetImage(
                                  "assets/images/registro02.png"),
                            )
                          : Container(),
                  Expanded(
                    child: Observer(
                      builder: (_) {
                        return CarouselSlider(
                          carouselController:
                              controller.buttonCarouselController,
                          options: CarouselOptions(
                            height: double.infinity,
                            scrollPhysics: const NeverScrollableScrollPhysics(),
                            initialPage: 0,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            aspectRatio: 2.0,
                            onPageChanged: (index, reason) =>
                                controller.setIndex(index),
                          ),
                          items: [
                            const RegistrarPage1(),
                            const RegistrarPage2(),
                            const RegistrarPage3(),
                          ].map((widget) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: const EdgeInsets.only(
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
                                          offset: const Offset(0, 0),
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
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Observer(builder: (_) {
                          return ButtonTheme(
                            minWidth: 120.0,
                            height: 40,
                            child: StandardButton(
                              onPressed: () {
                                if (controller.current != 0) {
                                  controller.setPreviousPage();
                                } else if (controller.current == 0) {
                                  Modular.to.pop();
                                }
                              },
                              text: controller.current == 0
                                  ? 'Cancelar'
                                  : 'Voltar',
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
                                if (controller.current != 2) {
                                  controller.setNextPage();
                                } else {
                                  controller.isPage3Valid();

                                  if (controller.page3Valid) {
                                    var emailValido =
                                        await controller.emailValido();
                                    if (emailValido) {
                                      buildShowGeneralDialog(
                                        context,
                                        'C??digo de Confirma????o',
                                        'Enviamos no seu e-mail um c??digo de confirma????o, insira ele para validar seu cadastro',
                                      );
                                    } else if (!emailValido) {
                                      buildShowGeneralDialogMessage(
                                        context,
                                        'Erro',
                                        'O e-mail que est?? tentando cadastrar j?? existe, tente voltar e usar a recupera????o de senha.',
                                      );
                                    }
                                  }
                                }
                              },
                              text: controller.current == 2
                                  ? 'Concluir'
                                  : 'Pr??ximo',
                              color: Theme.of(context).primaryColor,
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future buildShowGeneralDialog(
      BuildContext context, String titulo, String mensagem) {
    controller.enviarEmail();
    return showGeneralDialog(
      barrierLabel: "Mensage",
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, anim1, anim2) => Container(),
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

  SizedBox buildMensage(BuildContext context, String titulo, String mensagem) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .5,
      child: Observer(builder: (_) {
        return Column(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Observer(builder: (_) {
                return Form(
                  key: controller.formkeyPage4,
                  child: TextFormField(
                    onChanged: (value) {
                      controller.setClickedButton(false);
                      controller.setCode(value);
                    },
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo n??o pode estar vazio';
                      } else if (value.length < 4) {
                        return 'C??digo inv??lido';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.code,
                        color: Theme.of(context).primaryColor,
                      ),
                      hintText: 'C??digo de Confirma????o',
                    ),
                  ),
                );
              }),
            ),
            const Spacer(
              flex: 2,
            ),
            StandardButton(
              onPressed: () async {
                if (controller.formkeyPage4.currentState!.validate()) {
                  controller.setClickedButton(true);
                  if (controller.code == controller.codigoGerado) {
                    // progressDialog.style(message: "Validando..");
                    progressDialog.show(
                      msg: "Carregando...",
                      backgroundColor: Colors.white,
                      borderRadius: 5.0,
                      progressType: ProgressType.normal,
                      // progressWidget: Padding(
                      //   padding: EdgeInsets.all(15.0),
                      //   child: CircularProgressIndicator(),
                      // ),
                      max: 3,
                    );
                    var res = await controller.registrar();
                    Future.delayed(const Duration(seconds: 2), () async {
                      progressDialog.close();
                      if (res != null) {
                        await authController
                            .addStringToSF(controller.email.text);
                        Modular.to.pushReplacementNamed('/start');
                      } else {
                        buildShowGeneralDialogMessage(
                          context,
                          'Erro',
                          'Ocorreu um erro ao registrar, verifique sua conex??o e tente novamente.',
                        );
                      }
                    });
                  }
                }
              },
              text: 'Confirmar',
              color: Theme.of(context).primaryColor,
            ),
            if (controller.clickedButton &&
                controller.code != controller.codigoGerado)
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'C??digo n??o corresponde ao enviado no e-mail.',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            else
              Container(),
            const Spacer(
              flex: 1,
            ),
          ],
        );
      }),
    );
  }

  Future buildShowGeneralDialogMessage(
      BuildContext context, String titulo, String mensagem) {
    return showGeneralDialog(
      barrierLabel: "Mensage",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, anim1, anim2) => Container(),
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
              content: buildMensageMessage(context, titulo, mensagem),
            ),
          ),
        );
      },
    );
  }

  SizedBox buildMensageMessage(
      BuildContext context, String titulo, String mensagem) {
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

  Color returnColorIndex(int i) {
    Color color = kContentColorLightTheme.withOpacity(
        .2); //Theme.of(context).textSelectionColor.withOpacity(.2);
    switch (i) {
      case 0:
        return controller.page1Valid
            ? Theme.of(context).colorScheme.secondary
            : Colors.grey;
      case 1:
        return controller.page2Valid
            ? Theme.of(context).colorScheme.secondary
            : Colors.grey;
      case 2:
        return controller.page3Valid
            ? Theme.of(context).colorScheme.secondary
            : Colors.grey;
      default:
        break;
    }
    return color;
  }
}
