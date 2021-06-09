import 'repositories/produtos_categorias_repository.dart';
import 'produtos_categorias_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'produtos_categorias_page.dart';

class ProdutosCategoriasModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $ProdutosCategoriasRepository,
        $ProdutosCategoriasController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ProdutosCategoriasPage()),
      ];

  static Inject get to => Inject<ProdutosCategoriasModule>.of();
}
