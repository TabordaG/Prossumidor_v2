import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  ReactionDisposer disposer;
  AnimationController controller;
  Animation<double> animationOpacity;
  Animation<double> animationOffset;
  final AuthController authcontroller = Modular.get<AuthController>();

  @override
  void initState() {
    final AuthController auth = Modular.get();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    disposer = autorun((_) async {
      // ### Verifica se possui o e-mail salvo no sharedPreference
      Future.delayed(Duration(seconds: 2), () async {
        int response = await auth.verificaLogado();
        switch (response) {
          case 0:
            Modular.to.pushReplacementNamed('/start');
            auth.insereDados();
            break;
          case 1:
            Modular.to.pushReplacementNamed('/login');
            break;
          case 2:
            buildShowGeneralDialog(context);
            break;
          default:
        }
      });
    });
    super.initState();
  }

  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Center(
            child: Image(
              image: AssetImage("assets/images/logo_splash.png"),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .75,
            right: MediaQuery.of(context).size.width * .45,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }

  Future buildShowGeneralDialog(BuildContext context) {
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
              content: buildMensage(context),
            ),
          ),
        );
      },
    );
  }

  Container buildMensage(BuildContext context) {
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
            "Erro de Versão",
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: 28,
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
            authcontroller.versaoAtual,
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
