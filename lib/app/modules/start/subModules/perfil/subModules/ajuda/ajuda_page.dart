import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'ajuda_controller.dart';

class AjudaPage extends StatefulWidget {
  final String title;
  const AjudaPage({Key? key, this.title = "Ajuda"}) : super(key: key);

  @override
  _AjudaPageState createState() => _AjudaPageState();
}

class _AjudaPageState extends ModularState<AjudaPage, AjudaController> {
  //use 'controller' variable to access controller
  final String firstQuestion = "Os Alimentos Agroecológicos são aqueles "
      "produzidos de forma responsável, livres de contaminantes, agrotóxicos, "
      "insumos químicos e que possuem mais qualidade nutricional evitando romper o "
      "equilíbrio ecológico que dá a estabilidade aos ecossistemas naturais, usando "
      "o emprego de aspectos da sustentabilidade social nas relações "
      "de trabalho no campo.";
  final String secondQuestion = "Os Alimentos Orgânicos são aqueles cultivados "
      "de maneira sustentável mediante a agricultura biológica (ou orgânica). Esse "
      "sistema não utiliza agrotóxicos, adubos químicos, aditivos sintéticos, "
      "antibióticos, hormônios, nem técnicas de engenharia alimentar. Respeita "
      "integralmente a natureza. Possui certificações e registros de qualidade e "
      "comprometimento. Neste tipo de produção são adotadas práticas que visam à "
      "preservação e o uso responsável do solo, da água e do ar, de modo a reduzir "
      "as formas de contaminação e desperdício dos recursos naturais, o que gera "
      "também economia, respeitando à integridade cultural das comunidades rurais, "
      "tendo por objetivo à sustentabilidade econômica e ecológica, a maximização "
      "dos benefícios sociais, a minimização da dependência de "
      "energia não renovável.";

  final String thirdQuestion = "Os Alimentos e Produtos Veganos são aqueles "
      "que não possuem nenhum tipo de origem animal, excluindo carnes de todos os "
      "tipos, além de ovos, laticínios, mel e gelatina. Preocupando-se com a saúde, "
      "com o meio ambiente e com os maus-tratos aos animais.";

  final String fourthQuestion = "Os Alimentos e Produtos Artesanais são "
      "aqueles produzidos com características tradicionais, culturais, regionais, "
      "processos de elaboração que se transmitem de geração em geração, conforme a "
      "tradição cultural, trazendo conformidade com padrões de identidade e "
      "qualidade de elaboração com a produção manual.";

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
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: kDefaultPadding * 0.8,
                      horizontal: kDefaultPadding),
                  child: Text(
                    "FAQ",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "O que são Alimentos Agroecológicos?",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: kDefaultPadding * 0.8,
                        right: kDefaultPadding * 0.8,
                        bottom: kDefaultPadding,
                      ),
                      child: Text(
                        firstQuestion,
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "O que são Alimentos Orgânicos?",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: kDefaultPadding * 0.8,
                        right: kDefaultPadding * 0.8,
                        bottom: kDefaultPadding,
                      ),
                      child: Text(secondQuestion),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "O que são Alimentos e Produtos Veganos?",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: kDefaultPadding * 0.8,
                        right: kDefaultPadding * 0.8,
                        bottom: kDefaultPadding,
                      ),
                      child: Text(thirdQuestion),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "O que são Alimentos e Produtos Artesanais?",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: kDefaultPadding * 0.8,
                        right: kDefaultPadding * 0.8,
                        bottom: kDefaultPadding,
                      ),
                      child: Text(fourthQuestion),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.8),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: "Para mais informações, acesse",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
