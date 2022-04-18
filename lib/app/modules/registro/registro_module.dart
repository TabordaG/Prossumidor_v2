import 'repositories/registro_repository.dart';
import 'registro_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'registro_page.dart';

class RegistroModule extends Module {
  @override
  final List<Bind> binds = [
    $RegistroRepository,
    $RegistroController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => RegistroPage()),
  ];
}
