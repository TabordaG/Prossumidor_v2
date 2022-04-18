import 'repositories/ajuda_repository.dart';
import 'ajuda_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'ajuda_page.dart';

class AjudaModule extends Module {
  @override
  final List<Bind> binds = [
    $AjudaRepository,
    $AjudaController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => AjudaPage()),
  ];
}
