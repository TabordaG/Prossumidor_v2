import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';
import 'subModules/produtosCategorias/produtos_categorias_module.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $HomeController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        ModularRouter("/produtosCategorias",
            module: ProdutosCategoriasModule()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
