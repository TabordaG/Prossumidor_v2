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
  late ReactionDisposer disposer;
  final AuthController authcontroller = Modular.get<AuthController>();

  @override
  void initState() {
    final AuthController auth = Modular.get();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);

    disposer = autorun((_) async {
      // ### Verifica se possui o e-mail salvo no sharedPreference
      Future.delayed(const Duration(seconds: 2), () async {
        int response = await auth.verificaLogado();
        switch (response) {
          case 0:
            buildShowGeneralDialog(context);
            Future.delayed(const Duration(seconds: 5), () {
              Modular.to.pushReplacementNamed('/start');
            });

            break;
          case 1:
            buildShowGeneralDialog(context);
            Future.delayed(const Duration(seconds: 5), () {
              Modular.to.pushReplacementNamed('/login');
            });

            break;
          case 2:
            Modular.to.pushReplacementNamed('/start');
            break;
          case 3:
            Modular.to.pushReplacementNamed('/login');
            break;

          default:
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Image(
            image: const AssetImage("assets/images/logo_splash.png"),
            fit: BoxFit.fill,
            height: heigth,
            width: width,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .75,
            right: MediaQuery.of(context).size.width * .45,
            child: const Center(
              child: CircularProgressIndicator(
                strokeWidth: 1,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future buildShowGeneralDialog(BuildContext context) {
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
              content: buildMensage(context),
            ),
          ),
        );
      },
    );
  }

  SizedBox buildMensage(BuildContext context) {
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
            "Nova Versão",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 28,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.color
                      ?.withOpacity(.8),
                ),
          ),
          const Spacer(
            flex: 2,
          ),
          Text(
            authcontroller.mensagemVersao ?? "...",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 16,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.color
                      ?.withOpacity(.6),
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
