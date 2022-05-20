import 'repositories/recuperar_senha_repository.dart';
import 'recuperar_senha_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'recuperar_senha_page.dart';

class RecuperarSenhaModule extends Module {
  @override
  final List<Bind> binds = [
    $RecuperarSenhaRepository,
    $RecuperarSenhaController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const RecuperarSenhaPage()),
  ];
}
