import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'ajuda_controller.dart';

class AjudaPage extends StatefulWidget {
  final String title;
  const AjudaPage({Key key, this.title = "Ajuda"}) : super(key: key);

  @override
  _AjudaPageState createState() => _AjudaPageState();
}

class _AjudaPageState extends ModularState<AjudaPage, AjudaController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text(widget.title),
    );
    return Scaffold(
      appBar: appBar,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: kDefaultPadding * 0.8,
                        horizontal: kDefaultPadding),
                    child: Text(
                      "FAQ",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                    ),
                  ),
                  ExpansionTile(
                    title: Text(
                      "Lorem ipsum dolor sit amet?",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: kDefaultPadding * 0.8,
                          right: kDefaultPadding * 0.8,
                          bottom: kDefaultPadding,
                        ),
                        child: Text(
                          "text1",
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text(
                      "Lorem ipsum dolor sit?",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: kDefaultPadding * 0.8,
                          right: kDefaultPadding * 0.8,
                          bottom: kDefaultPadding,
                        ),
                        child: Text("text1"),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text(
                      "Lorem ipsum dolor sit amet, consectetur?",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: kDefaultPadding * 0.8,
                          right: kDefaultPadding * 0.8,
                          bottom: kDefaultPadding,
                        ),
                        child: Text("text1"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.8),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: "Para mais informações, acesse",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                ),
                TextSpan(
                  text: "\nhttp://recoopsol.ic.ufmt.br",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      controller.launchInBrowser("http://recoopsol.ic.ufmt.br");
                    },
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      decoration: TextDecoration.underline),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
