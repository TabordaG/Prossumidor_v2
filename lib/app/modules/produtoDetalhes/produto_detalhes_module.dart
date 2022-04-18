import 'repositories/produto_detalhes_repository.dart';
import 'produto_detalhes_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'produto_detalhes_page.dart';

class ProdutoDetalhesModule extends Module {
  @override
  final List<Bind> binds = [
    $ProdutoDetalhesRepository,
    $ProdutoDetalhesController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => ProdutoDetalhesPage(
        produto: args.data['produto'],
      ),
      transition: TransitionType.rightToLeft,
    ),
  ];
}
