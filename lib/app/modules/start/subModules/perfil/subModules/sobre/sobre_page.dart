import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';
import 'sobre_controller.dart';

class SobrePage extends StatefulWidget {
  final String title;
  const SobrePage({Key? key, this.title = "Sobre"}) : super(key: key);

  @override
  _SobrePageState createState() => _SobrePageState();
}

class _SobrePageState extends ModularState<SobrePage, SobreController> {
  final SobreController sobreController = Modular.get<SobreController>();
  final AuthController authController = Modular.get<AuthController>();
  final String introducao =
      "O Aplicativo RECOOPSOL foi desenvolvido pelo Instituto de Computação da "
      "Universidade Federal de Mato Grosso. É parte dos projetos "
      "“Rede de Cooperação Solidária (Recoopsol) e “Campo a Mesa”, idealizados "
      "por membros da UFMT e parceiros, e financiados respectivamente pelo"
      " Ministério da Cidadania e pelo Programa REM do Governo de Mato Grosso."
      " Esses projetos objetivam o fortalecimento de instâncias da Economia "
      "Solidária, a transição Agroecológica, e a criação, implantação e "
      "fortalecimento de redes e arranjos produtivos locais nas áreas de "
      "alimentos, artesanato, confecções e serviços.";
  final String nossaMissao =
      "Ofertar produtos de agricultores familiares, artesãos e pequenos"
      " empreendedores de Mato Grosso para a população de Várzea Grande e Cuiabá,"
      " trazendo visibilidade para coletivos e produtores da Economia Solidária"
      " no Estado, ampliando seu mercado consumidor e sua renda, oferecendo"
      " produtos de qualidade para os consumidores, e contribuindo para o"
      " desenvolvimento territorial.";
  final String nossaVisao = "Apoiar os produtores nos seus processos de"
      " transição para uma produção verdadeiramente responsável e ampliar o número de"
      " consumidores de produtos Agroecológicos, Orgânicos e artesanais.";
  final String nossosValores = "Economia justa no que tangue os princípios"
      " comerciais de compra e venda, fortalecendo principalmente a"
      " Economia Solidária: Autogestão, cooperação, solidariedade, democracia,"
      " respeito à natureza, comércio justo, consumo solidário.";

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
                  padding: const EdgeInsets.only(
                    top: kDefaultPadding,
                    left: kDefaultPadding * 0.8,
                    right: kDefaultPadding * 0.8,
                    bottom: kDefaultPadding,
                  ),
                  child: Text(
                    introducao,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Nossa Missão",
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
                        nossaMissao,
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Nossa Visão",
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
                      child: Text(nossaVisao),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Nossos Valores",
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
                      child: Text(nossosValores),
                    ),
                  ],
                ),
                // ExpansionTile(
                //   title: Text(
                //     "Equipe Recoopsol",
                //     style: Theme.of(context).textTheme.bodyText1.copyWith(
                //           color: kPrimaryColor,
                //           fontWeight: FontWeight.w600,
                //           fontSize: 18,
                //         ),
                //   ),
                //   children: [
                //     Padding(
                //       padding: EdgeInsets.only(
                //         left: kDefaultPadding * 0.8,
                //         right: kDefaultPadding * 0.8,
                //         bottom: kDefaultPadding,
                //       ),
                //       child: Text("text1"),
                //     ),
                //   ],
                // ),
                // ExpansionTile(
                //   title: Text(
                //     "Equipe TI",
                //     style: Theme.of(context).textTheme.bodyText1.copyWith(
                //           color: kPrimaryColor,
                //           fontWeight: FontWeight.w600,
                //           fontSize: 18,
                //         ),
                //   ),
                //   children: [
                //     Padding(
                //       padding: EdgeInsets.only(
                //         left: kDefaultPadding * 0.8,
                //         right: kDefaultPadding * 0.8,
                //         bottom: kDefaultPadding,
                //       ),
                //       child: Text("text1"),
                //     ),
                //   ],
                // ),
                // ExpansionTile(
                //   title: Text(
                //     "Apoio",
                //     style: Theme.of(context).textTheme.bodyText1.copyWith(
                //           color: kPrimaryColor,
                //           fontWeight: FontWeight.w600,
                //           fontSize: 18,
                //         ),
                //   ),
                //   children: [
                //     Padding(
                //       padding: EdgeInsets.only(
                //         left: kDefaultPadding * 0.8,
                //         right: kDefaultPadding * 0.8,
                //         bottom: kDefaultPadding,
                //       ),
                //       child: Text("text1"),
                //     ),
                //   ],
                // );
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
                  text: "Aplicativo Recoopsol",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                ),
                TextSpan(
                  text: "\n2015-2022 Recoopsol - versão: 2.0.1",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
