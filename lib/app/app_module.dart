import 'package:prossumidor_v2/app/modules/login/login_module.dart';
import 'package:prossumidor_v2/app/modules/recuperarSenha/recuperar_senha_module.dart';
import 'package:prossumidor_v2/app/modules/registro/registro_module.dart';
import 'package:prossumidor_v2/app/modules/start/start_controller.dart';
import 'package:prossumidor_v2/app/modules/start/start_module.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/home/subModules/produtosCategorias/produtos_categorias_module.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/ajuda/ajuda_module.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/endereco/endereco_module.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/meus_dados/meus_dados_module.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/sobre/sobre_module.dart';
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
    Bind((i) => StartController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const SplashScreen()),
    ModuleRoute("/start/", module: StartModule()),
    ModuleRoute("/login", module: LoginModule()),
    ModuleRoute("/home", module: HomeModule()),
    ModuleRoute("/produtosCategorias", module: ProdutosCategoriasModule()),
    ModuleRoute("/produtoDetalhes", module: ProdutoDetalhesModule()),
    ModuleRoute("/chat", module: ChatModule()),
    ModuleRoute("/pedidos", module: PedidosModule()),
    ModuleRoute("/perfil", module: PerfilModule()),
    ModuleRoute("/endereco",
        module: EnderecoModule(), transition: TransitionType.rightToLeft),
    ModuleRoute("/meus_dados",
        module: MeusDadosModule(), transition: TransitionType.rightToLeft),
    ModuleRoute("/sobre",
        module: SobreModule(), transition: TransitionType.rightToLeft),
    ModuleRoute("/ajuda",
        module: AjudaModule(), transition: TransitionType.rightToLeft),
    ModuleRoute("/recuperarSenha", module: RecuperarSenhaModule()),
    ModuleRoute("/registro", module: RegistroModule()),
    ModuleRoute("/sacola", module: SacolaModule()),
  ];
}
