import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/chat/chat_module.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/home/home_module.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/pedidos/pedidos_module.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/perfil_module.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/sacola/sacola_module.dart';
import '../../app_controller.dart';
import 'start_controller.dart';

class StartPage extends StatefulWidget {
  final String title;
  const StartPage({Key key, this.title = "Start"}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends ModularState<StartPage, StartController> {
  final AppController appController = Modular.get<AppController>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          body: PageView(
            controller: appController.pageViewController,
            children: [
              RouterOutlet(module: SacolaModule()),
              RouterOutlet(module: PedidosModule()),
              RouterOutlet(module: HomeModule()),
              RouterOutlet(module: ChatModule()),
              RouterOutlet(module: PerfilModule()),
            ],
          ),
          bottomNavigationBar: Observer(builder: (_) {
            return FFNavigationBar(
              theme: FFNavigationBarTheme(
                barBackgroundColor: Theme.of(context).primaryColor,
                selectedItemBorderColor: Theme.of(context).primaryColor,
                selectedItemBackgroundColor: Theme.of(context).primaryColor,
                selectedItemIconColor: Colors.white,
                selectedItemLabelColor: Colors.white,
                unselectedItemIconColor: Colors.white.withOpacity(.6),
                unselectedItemLabelColor: Colors.white.withOpacity(.6),
              ),
              selectedIndex: appController.indexBottomNavigator,
              onSelectTab: (index) {
                appController.pageViewController.jumpToPage(
                  index,
                  // duration: Duration(milliseconds: 500),
                  // curve: Curves.ease,
                );
              },
              items: [
                FFNavigationBarItem(
                  iconData: Icons.shopping_bag,
                  label: 'Sacola',
                ),
                FFNavigationBarItem(
                  iconData: Icons.receipt_long,
                  label: 'Pedidos',
                ),
                FFNavigationBarItem(
                  iconData: Icons.home,
                  label: 'Home',
                ),
                FFNavigationBarItem(
                  iconData: Icons.chat,
                  label: 'Chat',
                ),
                FFNavigationBarItem(
                  iconData: Icons.person,
                  label: 'Perfil',
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
