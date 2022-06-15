import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';
import 'perfil_controller.dart';

class PerfilPage extends StatefulWidget {
  final String title;
  const PerfilPage({Key? key, this.title = "Perfil"}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends ModularState<PerfilPage, PerfilController> {
  final AuthController authController = Modular.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    final PerfilController perfilController = Modular.get<PerfilController>();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.person, color: Colors.white),
            const SizedBox(
              width: kDefaultPadding * 0.25,
            ),
            Text(widget.title),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: kDefaultPadding * 0.5),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: const SizedBox(
                  height: 50,
                  width: 50,
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/newLogo_1.png'),
                  ),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Observer(builder: (_) {
                  return Text(
                    controller.nome,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 20,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color!
                              .withOpacity(0.9),
                        ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  );
                }),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Observer(builder: (_) {
                  return Text(
                    "Centro de distribuição: ${controller.centroDistribuicao}",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 14,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color!
                              .withOpacity(0.8),
                        ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  );
                }),
              )
            ],
          ),
          Divider(
            height: kDefaultPadding,
            thickness: 1,
            color: Theme.of(context).colorScheme.secondary.withOpacity(.2),
          ),
          Expanded(
            child: ListView(
              controller: perfilController.scrollController,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: [
                ListTitlePerfil(
                  title: "Endereço",
                  subtitle: "Meu endereço de entrega",
                  iconData: Icons.location_on,
                  function: () {
                    Navigator.of(context).pushNamed('/endereco');
                  },
                ),
                ListTitlePerfil(
                  title: "Meus Dados",
                  subtitle: "Minhas informações pessoais",
                  iconData: Icons.person,
                  function: () {
                    Navigator.of(context).pushNamed('/meus_dados');
                  },
                ),
                ListTitlePerfil(
                  title: "Sobre",
                  subtitle: "Informações sobre a Recoopsol",
                  iconData: Icons.info,
                  function: () {
                    Navigator.of(context).pushNamed('/sobre');
                  },
                ),
                ListTitlePerfil(
                  title: "Ajuda",
                  iconData: Icons.help,
                  function: () {
                    Navigator.of(context).pushNamed('/ajuda');
                  },
                ),
                ListTitlePerfil(
                  title: "Sair",
                  subtitle: "Desconectar minha conta",
                  iconData: Icons.exit_to_app,
                  function: () {
                    authController.removeValues();
                    authController.cleanUser();
                    Modular.to.pushReplacementNamed('/login');
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListTitlePerfil extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData iconData;
  final Function function;
  const ListTitlePerfil({
    Key? key,
    required this.title,
    this.subtitle,
    required this.iconData,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      leading: Icon(
        iconData,
        color: Theme.of(context).primaryColor,
        size: 30,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 18,
              color:
                  Theme.of(context).textTheme.bodyText1!.color!.withOpacity(1),
            ),
      ),
      subtitle: Text(subtitle ?? ""),
      trailing: IconButton(
        icon: const Icon(
          Icons.chevron_right,
          color: Colors.black,
        ),
        onPressed: () {
          function();
        },
      ),
    );
  }
}
