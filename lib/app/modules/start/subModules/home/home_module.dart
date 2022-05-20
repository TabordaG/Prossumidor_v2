import 'package:prossumidor_v2/app/modules/start/subModules/home/repositories/home_repository.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';
import 'subModules/produtosCategorias/produtos_categorias_module.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    $HomeRepository,
    $HomeController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
    ModuleRoute("/produtosCategorias", module: ProdutosCategoriasModule()),
  ];
}
