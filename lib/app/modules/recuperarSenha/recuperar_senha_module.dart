import 'repositories/recuperar_senha_repository.dart';
import 'recuperar_senha_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'recuperar_senha_page.dart';

class RecuperarSenhaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $RecuperarSenhaRepository,
        $RecuperarSenhaController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => RecuperarSenhaPage()),
      ];

  static Inject get to => Inject<RecuperarSenhaModule>.of();
}
