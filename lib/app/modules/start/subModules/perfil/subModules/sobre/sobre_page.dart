import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'sobre_controller.dart';

class SobrePage extends StatefulWidget {
  final String title;
  const SobrePage({Key key, this.title = "Sobre"}) : super(key: key);

  @override
  _SobrePageState createState() => _SobrePageState();
}

class _SobrePageState extends ModularState<SobrePage, SobreController> {
  final SobreController sobreController = Modular.get<SobreController>();
  final String text1 =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque vel eleifend odio. Aliquam felis purus, laoreet eget leo ut, tincidunt ultricies neque. Sed at ligula ac erat placerat interdum vitae at enim. Vivamus semper nisi libero, quis condimentum augue lacinia ut. Duis sit amet neque lobortis, fringilla ante sed, blandit tellus. ";

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
                  ExpansionTile(
                    title: Text(
                      "Nossa Missão",
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
                          text1,
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text(
                      "Nossa Visão",
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
                        child: Text(text1),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text(
                      "Nossos Valores",
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
                        child: Text(text1),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text(
                      "Equipe Recoopsol",
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
                        child: Text(text1),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text(
                      "Equipe TI",
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
                        child: Text(text1),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text(
                      "Apoio",
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
                        child: Text(text1),
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
                  text: "Aplicativo Recoopsol",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                ),
                TextSpan(
                  text: "\n2015-2021 Recoopsol - versão: 1.0.2",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
