import 'package:prossumidor_v2/app/modules/Login/login_module.dart';
import 'package:prossumidor_v2/app/modules/chat/chat_module.dart';
import 'package:prossumidor_v2/app/modules/pedidos/pedidos_module.dart';
import 'package:prossumidor_v2/app/modules/perfil/perfil_module.dart';
import 'package:prossumidor_v2/app/modules/produtoDetalhes/produto_detalhes_module.dart';
import 'package:prossumidor_v2/app/modules/produtosCategorias/produtos_categorias_module.dart';
import 'package:prossumidor_v2/app/modules/recuperarSenha/recuperar_senha_module.dart';
import 'package:prossumidor_v2/app/modules/registro/registro_module.dart';
import 'package:prossumidor_v2/app/modules/sacola/sacola_module.dart';
import 'package:prossumidor_v2/app/splash/splash_screen.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:prossumidor_v2/app/app_widget.dart';
import 'package:prossumidor_v2/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, __) => SplashScreen()),
        ModularRouter("/login", module: LoginModule()),
        ModularRouter("/home", module: HomeModule()),
        ModularRouter("/chat", module: ChatModule()),
        ModularRouter("/pedidos", module: PedidosModule()),
        ModularRouter("/perfil", module: PerfilModule()),
        ModularRouter("/produtoDetalhes", module: ProdutoDetalhesModule()),
        ModularRouter("/produtosCategorias",
            module: ProdutosCategoriasModule()),
        ModularRouter("/recuperarSenha", module: RecuperarSenhaModule()),
        ModularRouter("/registro", module: RegistroModule()),
        ModularRouter("/sacola", module: SacolaModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
