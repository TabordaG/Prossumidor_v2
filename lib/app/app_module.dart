import 'package:prossumidor_v2/app/modules/login/login_module.dart';
import 'package:prossumidor_v2/app/modules/recuperarSenha/recuperar_senha_module.dart';
import 'package:prossumidor_v2/app/modules/registro/registro_module.dart';
import 'package:prossumidor_v2/app/modules/start/start_module.dart';
import 'package:prossumidor_v2/app/shared/auth/repositories/auth_repository.dart';
import 'package:prossumidor_v2/app/shared/auth/repositories/interfaces/auth_repository_interface.dart';
import 'package:prossumidor_v2/app/splash/splash_screen.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/Login/login_controller.dart';
import 'modules/produtoDetalhes/produto_detalhes_module.dart';
import 'modules/start/subModules/chat/chat_module.dart';
import 'modules/start/subModules/home/home_module.dart';
import 'modules/start/subModules/pedidos/pedidos_module.dart';
import 'modules/start/subModules/perfil/perfil_module.dart';
import 'modules/start/subModules/sacola/sacola_module.dart';
import 'shared/auth/auth_controller.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    $AppController,
    Bind<IAuthRepository>((i) => AuthRepository()),
    Bind((i) => AuthController()),
    Bind((i) => LoginController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const SplashScreen()),
    ModuleRoute("/start", module: StartModule()),
    ModuleRoute("/login", module: LoginModule()),
    ModuleRoute("/home", module: HomeModule()),
    ModuleRoute("/produtoDetalhes", module: ProdutoDetalhesModule()),
    ModuleRoute("/chat", module: ChatModule()),
    ModuleRoute("/pedidos", module: PedidosModule()),
    ModuleRoute("/perfil", module: PerfilModule()),
    ModuleRoute("/recuperarSenha", module: RecuperarSenhaModule()),
    ModuleRoute("/registro", module: RegistroModule()),
    ModuleRoute("/sacola", module: SacolaModule()),
  ];
}
