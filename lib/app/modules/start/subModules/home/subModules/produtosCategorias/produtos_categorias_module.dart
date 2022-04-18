import 'repositories/produtos_categorias_repository.dart';
import 'produtos_categorias_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'produtos_categorias_page.dart';

class ProdutosCategoriasModule extends Module {
  @override
  final List<Bind> binds = [
    $ProdutosCategoriasRepository,
    $ProdutosCategoriasController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => ProdutosCategoriasPage(
        marcaProduto: args.data['marcaProduto'],
        categoriaProduto: args.data['categoriaProduto'],
        isCategoria: args.data['isCategoria'],
      ),
      transition: TransitionType.rightToLeft,
    ),
  ];
}
