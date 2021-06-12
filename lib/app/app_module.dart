import 'package:prossumidor_v2/app/modules/Login/login_module.dart';
import 'package:prossumidor_v2/app/modules/recuperarSenha/recuperar_senha_module.dart';
import 'package:prossumidor_v2/app/modules/registro/registro_module.dart';
import 'package:prossumidor_v2/app/modules/start/start_module.dart';
import 'package:prossumidor_v2/app/shared/auth/repositories/auth_repository.dart';
import 'package:prossumidor_v2/app/shared/auth/repositories/interfaces/auth_repository_interface.dart';
import 'package:prossumidor_v2/app/splash/splash_screen.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:prossumidor_v2/app/app_widget.dart';

import 'modules/Login/login_controller.dart';
import 'modules/produtoDetalhes/produto_detalhes_module.dart';
import 'modules/start/subModules/chat/chat_module.dart';
import 'modules/start/subModules/home/home_module.dart';
import 'modules/start/subModules/pedidos/pedidos_module.dart';
import 'modules/start/subModules/perfil/perfil_module.dart';
import 'modules/start/subModules/sacola/sacola_module.dart';
import 'shared/auth/auth_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController()),
        Bind((i) => LoginController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, __) => SplashScreen()),
        ModularRouter("/start", module: StartModule()),
        ModularRouter("/login", module: LoginModule()),
        ModularRouter("/home", module: HomeModule()),
        ModularRouter("/produtoDetalhes", module: ProdutoDetalhesModule()),
        ModularRouter("/chat", module: ChatModule()),
        ModularRouter("/pedidos", module: PedidosModule()),
        ModularRouter("/perfil", module: PerfilModule()),
        ModularRouter("/recuperarSenha", module: RecuperarSenhaModule()),
        ModularRouter("/registro", module: RegistroModule()),
        ModularRouter("/sacola", module: SacolaModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
