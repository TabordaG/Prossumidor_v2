import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/injects/routes.dart';
import '../modules/login/login_page.dart';
import '../modules/produtoDetalhes/produto_detalhes_page.dart';
import '../modules/recuperarSenha/recuperar_senha_page.dart';
import '../modules/registro/registro_page.dart';
import '../modules/start/start_page.dart';
import '../modules/start/subModules/chat/chat_page.dart';
import '../modules/start/subModules/home/home_page.dart';
import '../modules/start/subModules/home/subModules/produtosCategorias/produtos_categorias_page.dart';
import '../modules/start/subModules/pedidos/pedidos_page.dart';
import '../modules/start/subModules/perfil/subModules/ajuda/ajuda_page.dart';
import '../modules/start/subModules/perfil/subModules/endereco/endereco_page.dart';
import '../modules/start/subModules/perfil/subModules/meus_dados/meus_dados_page.dart';
import '../modules/start/subModules/perfil/subModules/sobre/sobre_page.dart';
import '../modules/start/subModules/sacola/sacola_page.dart';
import '../splash/splash_screen.dart';

final appPages = [
  ChildRoute(Modular.initialRoute, child: (_, __) => const SplashScreen()),
  ChildRoute(RoutePages.startRoute, child: (_, __) => const StartPage()),
  ChildRoute(RoutePages.loginRoute, child: (_, __) => const LoginPage()),
  ChildRoute(RoutePages.homeRoute, child: (_, __) => const HomePage()),
  ChildRoute(RoutePages.chatRoute, child: (_, __) => const ChatPage()),
  ChildRoute(RoutePages.pedidosRoute, child: (_, __) => const PedidosPage()),
  ChildRoute(RoutePages.enderecoRoute, child: (_, __) => const EnderecoPage()),
  ChildRoute(RoutePages.meusDadosRoute,
      child: (_, __) => const MeusDadosPage()),
  ChildRoute(RoutePages.sobreRoute, child: (_, __) => const SobrePage()),
  ChildRoute(RoutePages.ajudaRoute, child: (_, __) => const AjudaPage()),
  ChildRoute(RoutePages.registroRoute, child: (_, __) => const RegistroPage()),
  ChildRoute(RoutePages.sacolaRoute, child: (_, __) => const SacolaPage()),
  ChildRoute(RoutePages.recuperarSenhaRoute,
      child: (_, __) => const RecuperarSenhaPage()),
  ChildRoute(RoutePages.produtosCategoriasRoute,
      child: (_, args) => ProdutosCategoriasPage(
            categoriaProduto: args.data["categoriaProduto"],
            isCategoria: args.data["isCategoria"],
            marcaProduto: args.data['marcaProduto'],
          )),
  ChildRoute(RoutePages.produtoDetalhesRoute,
      child: (_, __) => const ProdutoDetalhesPage()),
];
