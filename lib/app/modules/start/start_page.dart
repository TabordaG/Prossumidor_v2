// import 'package:ff_navigation_bar/ff_navigation_bar.dart';
// ignore_for_file: empty_catches

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/chat/chat_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/home/home_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/pedidos/pedidos_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/sacola/sacola_controller.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';
import '../../app_controller.dart';
import 'start_controller.dart';

class StartPage extends StatefulWidget {
  final String title;
  // ignore: use_key_in_widget_constructors
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
          body: const RouterOutlet(),
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
                    if (index == 0) {
                      try {
                        Modular.to.navigate('/sacola/');
                        if (Modular.get<SacolaController>() != null) {
                          final SacolaController sacolaController =
                              Modular.get<SacolaController>();
                          sacolaController.buscarProdutos();
                        }
                      } catch (e) {}
                    } else if (index == 1) {
                      try {
                        Modular.to.navigate('/pedidos/');
                        if (Modular.get<PedidosController>() != null) {
                          final PedidosController pedidosController =
                              Modular.get<PedidosController>();
                          pedidosController.chamarListaEntregue();
                          pedidosController.chamarListaEmAndamento();
                          pedidosController.chamarListaNaoEntregueCancelado();
                        }
                      } catch (e) {}
                    } else if (index == 2) {
                      try {
                        if (appController.pageViewController.page == 2) {
                          final HomeController homeController =
                              Modular.get<HomeController>();
                          homeController.scrollController.animateTo(
                            0,
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Modular.to.navigate('/home/');
                          authController.buscaMensagem();
                        }
                      } catch (e) {}
                    } else if (index == 3) {
                      try {
                        Modular.to.navigate('/chat/');
                        final ChatController chatController =
                            Modular.get<ChatController>();
                        chatController.buscaChats();
                      } catch (e) {}
                    } else if (index == 4) {
                      try {
                        Modular.to.navigate('/perfil/');
                      } catch (e) {}
                    }
                  },
                  currentIndex: appController.indexBottomNavigator,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.shopping_bag,
                        // color: kPrimaryColor,
                      ),
                      tooltip: "Sacola",
                      label: "Sacola",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.receipt_long,
                        // color: kPrimaryColor,
                      ),
                      label: "Pedidos",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        // color: kPrimaryColor,
                      ),
                      label: "Início",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.chat,
                        // color: kPrimaryColor,
                      ),
                      label: "Chat",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
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
                          decoration: const BoxDecoration(
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
