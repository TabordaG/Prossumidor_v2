import 'repositories/produto_detalhes_repository.dart';
import 'produto_detalhes_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'produto_detalhes_page.dart';

class ProdutoDetalhesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $ProdutoDetalhesRepository,
        $ProdutoDetalhesController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ProdutoDetalhesPage()),
      ];

  static Inject get to => Inject<ProdutoDetalhesModule>.of();
}
