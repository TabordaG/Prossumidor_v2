// import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/chat/chat_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/chat/chat_module.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/home/home_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/home/home_module.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/pedidos/pedidos_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/pedidos/pedidos_module.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/perfil_module.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/sacola/sacola_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/sacola/sacola_module.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';
import '../../app_controller.dart';
import 'start_controller.dart';

class StartPage extends StatefulWidget {
  final String title;
  const StartPage({this.title = "Start"});

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends ModularState<StartPage, StartController> {
  final AppController appController = Modular.get<AppController>();
  final AuthController authController = Modular.get<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          body: PageView(
            controller: appController.pageViewController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              RouterOutlet(module: SacolaModule()),
              RouterOutlet(module: PedidosModule()),
              RouterOutlet(module: HomeModule()),
              RouterOutlet(module: ChatModule()),
              RouterOutlet(module: PerfilModule()),
            ],
          ),
          bottomNavigationBar: Observer(builder: (_) {
            return Stack(
              children: [
                BottomNavigationBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  selectedItemColor: Colors.white,
                  selectedLabelStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    overflow: TextOverflow.clip,
                    leadingDistribution: TextLeadingDistribution.even,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 8,
                    overflow: TextOverflow.ellipsis,
                    leadingDistribution: TextLeadingDistribution.proportional,
                    color: Colors.white.withOpacity(.6),
                  ),
                  fixedColor: Colors.black,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: true,
                  onTap: (index) {
                    try {
                      if (index == 2 &&
                          appController.pageViewController.page == 2) {
                        final HomeController homeController =
                            Modular.get<HomeController>();
                        homeController.scrollController.animateTo(
                          0,
                          duration: Duration(milliseconds: 800),
                          curve: Curves.easeInOut,
                        );
                      }
                    } catch (e) {}
                    appController.pageViewController.jumpToPage(
                      index,
                      // duration: Duration(milliseconds: 500),
                      // curve: Curves.ease,
                    );
                    try {
                      if (index == 0 &&
                          Modular.get<SacolaController>() != null) {
                        final SacolaController sacolaController =
                            Modular.get<SacolaController>();
                        sacolaController.buscarProdutos();
                      }
                    } catch (e) {}
                    try {
                      if (index == 1 &&
                          Modular.get<PedidosController>() != null) {
                        final PedidosController pedidosController =
                            Modular.get<PedidosController>();
                        pedidosController.chamarListaEntregue();
                        pedidosController.chamarListaEmAndamento();
                        pedidosController.chamarListaNaoEntregueCancelado();
                      }
                    } catch (e) {}
                    try {
                      if (index == 2) {
                        authController.buscaMensagem();
                      }
                    } catch (e) {}
                    try {
                      if (index == 3) {
                        final ChatController chatController =
                            Modular.get<ChatController>();
                        chatController.buscaChats();
                      }
                    } catch (e) {}
                  },
                  currentIndex: appController.indexBottomNavigator,
                  items: [
                    BottomNavigationBarItem(
                      icon: const Icon(
                        Icons.shopping_bag,
                        // color: kPrimaryColor,
                      ),
                      tooltip: "Sacola",
                      label: "Sacola",
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(
                        Icons.receipt_long,
                        // color: kPrimaryColor,
                      ),
                      label: "Pedidos",
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(
                        Icons.home,
                        // color: kPrimaryColor,
                      ),
                      label: "Início",
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(
                        Icons.chat,
                        // color: kPrimaryColor,
                      ),
                      label: "Chat",
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(
                        Icons.person,
                        // color: kPrimaryColor,
                      ),
                      label: "Perfil",
                    ),
                  ],
                ),
                // FFNavigationBar(
                //   theme: FFNavigationBarTheme(
                //     barBackgroundColor: Theme.of(context).primaryColor,
                //     selectedItemBorderColor: Theme.of(context).primaryColor,
                //     selectedItemBackgroundColor: Theme.of(context).primaryColor,
                //     selectedItemIconColor: Colors.white,
                //     selectedItemLabelColor: Colors.white,
                //     unselectedItemIconColor: Colors.white.withOpacity(.6),
                //     unselectedItemLabelColor: Colors.white.withOpacity(.6),
                //   ),
                //   selectedIndex: appController.indexBottomNavigator,
                //   onSelectTab: (index) {
                // try {
                //   if (index == 2 &&
                //       appController.pageViewController.page == 2) {
                //     final HomeController homeController =
                //         Modular.get<HomeController>();
                //     homeController.scrollController.animateTo(
                //       0,
                //       duration: Duration(milliseconds: 800),
                //       curve: Curves.easeInOut,
                //     );
                //   }
                // } catch (e) {}
                // appController.pageViewController.jumpToPage(
                //   index,
                //   // duration: Duration(milliseconds: 500),
                //   // curve: Curves.ease,
                // );
                // try {
                //   if (index == 0 &&
                //       Modular.get<SacolaController>() != null) {
                //     final SacolaController sacolaController =
                //         Modular.get<SacolaController>();
                //     sacolaController.buscarProdutos();
                //   }
                // } catch (e) {}
                // try {
                //   if (index == 1 &&
                //       Modular.get<PedidosController>() != null) {
                //     final PedidosController pedidosController =
                //         Modular.get<PedidosController>();
                //     pedidosController.chamarListaEntregue();
                //     pedidosController.chamarListaEmAndamento();
                //     pedidosController.chamarListaNaoEntregueCancelado();
                //   }
                // } catch (e) {}
                // try {
                //   if (index == 2) {
                //     authController.buscaMensagem();
                //   }
                // } catch (e) {}
                // try {
                //   if (index == 3) {
                //     final ChatController chatController =
                //         Modular.get<ChatController>();
                //     chatController.buscaChats();
                //   }
                // } catch (e) {}
                //   },
                //   items: [
                //     FFNavigationBarItem(
                //       iconData: Icons.shopping_bag,
                //       label: 'Sacola',
                //     ),
                //     FFNavigationBarItem(
                //       iconData: Icons.receipt_long,
                //       label: 'Pedidos',
                //     ),
                //     FFNavigationBarItem(
                //       iconData: Icons.home,
                //       label: 'Início',
                //     ),
                //     FFNavigationBarItem(
                //       iconData: Icons.chat,
                //       label: 'Chat',
                //     ),
                //     FFNavigationBarItem(
                //       iconData: Icons.person,
                //       label: 'Perfil',
                //     ),
                //   ],
                // ),
                authController.temMensagem
                    ? Positioned(
                        bottom: 46,
                        right: 95,
                        child: Container(
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.redAccent,
                          ),
                        ),
                      )
                    : Container(
                        height: 0,
                      ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
