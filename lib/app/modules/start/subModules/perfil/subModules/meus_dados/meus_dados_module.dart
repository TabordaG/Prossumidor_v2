import 'repositories/meus_dados_repository.dart';
import 'meus_dados_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'meus_dados_page.dart';

class MeusDadosModule extends Module {
  @override
  final List<Bind> binds = [
    $MeusDadosRepository,
    $MeusDadosController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const MeusDadosPage()),
  ];
}
