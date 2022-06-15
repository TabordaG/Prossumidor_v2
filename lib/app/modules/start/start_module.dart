import 'package:prossumidor_v2/app/modules/start/subModules/chat/chat_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/chat/chat_module.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/chat/repositories/chat_repository.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/home/home_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/home/home_module.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/home/repositories/home_repository.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/home/subModules/produtosCategorias/produtos_categorias_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/home/subModules/produtosCategorias/produtos_categorias_module.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/home/subModules/produtosCategorias/repositories/produtos_categorias_repository.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/pedidos/pedidos_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/pedidos/pedidos_module.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/pedidos/repositories/pedidos_repository.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/perfil_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/perfil_module.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/repositories/perfil_repository.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/endereco/endereco_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/sacola/repositories/sacola_repository.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/sacola/sacola_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/sacola/sacola_module.dart';
import 'start_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'start_page.dart';

class StartModule extends Module {
  @override
  final List<Bind> binds = [
    $StartController,
    Bind((i) => SacolaRepository()),
    Bind((i) => PedidosRepository()),
    Bind((i) => HomeRepository()),
    Bind((i) => ChatRepository()),
    Bind((i) => PerfilRepository()),
    Bind((i) => SacolaController()),
    Bind((i) => PedidosController()),
    Bind((i) => HomeController()),
    Bind((i) => ChatController()),
    Bind((i) => PerfilController()),
    Bind.singleton((i) => HomeModule()),
    Bind.singleton((i) => ChatModule()),
    Bind.singleton((i) => PedidosModule()),
    Bind.singleton((i) => SacolaModule()),
    Bind.singleton((i) => PerfilModule()),
    Bind.singleton((i) => ProdutosCategoriasRepository()),
    Bind.singleton((i) => ProdutosCategoriasRepository()),
    Bind.singleton((i) => ProdutosCategoriasController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const StartPage()),
    // ModuleRoute("/home", module: HomeModule()),
    // ModuleRoute("/produtoDetalhes", module: ProdutoDetalhesModule()),
    // ModuleRoute("/chat", module: ChatModule()),
    // ModuleRoute("/pedidos", module: PedidosModule()),
    ModuleRoute("/perfil", module: PerfilModule()),
    // ModuleRoute("/sacola", module: SacolaModule()),
  ];
}
